#!/usr/bin/env python3
"""
SyncFile2CSV - Python port of the Epi Info .epi7 to CSV converter.

Decrypts encrypted Epi Info Sync Files and converts them to CSV format.
"""

import argparse
import base64
import csv
import os
import sys
import xml.etree.ElementTree as ET
from hashlib import pbkdf2_hmac
from io import StringIO

from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.backends import default_backend
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Fixed cryptographic parameters (from Epi Info Android APK v1.4.3)
# Note: The GitHub source has empty placeholders, but the actual APK uses these values
IV_HEX = os.getenv('EPI_IV', '')
SALT_HEX = os.getenv('EPI_SALT', '')
PBKDF2_ITERATIONS = 1000
KEY_LENGTH_BYTES = 16  # 128 bits


def hex_to_bytes(hex_string: str) -> bytes:
    """Convert a hex string to bytes."""
    return bytes.fromhex(hex_string)


def derive_key(password: str, salt: bytes, iterations: int, key_length: int) -> bytes:
    """Derive AES key from password using PBKDF2."""
    return pbkdf2_hmac(
        'sha1',
        password.encode('utf-8'),
        salt,
        iterations,
        dklen=key_length
    )


def decrypt_epi7(ciphertext_b64: str, password: str) -> str:
    """
    Decrypt an Epi Info .epi7 file content.

    Args:
        ciphertext_b64: Base64-encoded ciphertext from the .epi7 file
        password: User-provided password

    Returns:
        Decrypted XML string
    """
    # Decode base64 ciphertext
    ciphertext = base64.b64decode(ciphertext_b64)

    # Derive key using PBKDF2
    salt = hex_to_bytes(SALT_HEX)
    key = derive_key(password, salt, PBKDF2_ITERATIONS, KEY_LENGTH_BYTES)

    # Setup AES-128-CBC decryption
    iv = hex_to_bytes(IV_HEX)
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    decryptor = cipher.decryptor()

    # Decrypt
    padded_plaintext = decryptor.update(ciphertext) + decryptor.finalize()

    # Remove PKCS7 padding
    unpadder = padding.PKCS7(128).unpadder()
    plaintext = unpadder.update(padded_plaintext) + unpadder.finalize()

    return plaintext.decode('utf-8')


def parse_xml_to_csv(xml_text: str, separator: str = ",") -> str:
    """
    Parse decrypted XML and convert to CSV format.

    Args:
        xml_text: Decrypted XML string
        separator: CSV field separator (default comma)

    Returns:
        CSV formatted string
    """
    # Fix unescaped ampersands
    xml_text = xml_text.replace("&", "&amp;")

    root = ET.fromstring(xml_text)

    if root.tag.lower() != "surveyresponses":
        raise ValueError(f"Expected 'SurveyResponses' root element, got '{root.tag}'")

    # First pass: collect all field names
    field_names = []
    has_fkey = False

    for response in root:
        if response.tag.lower() == "surveyresponse":
            # Check if FKEY exists (second attribute)
            if len(response.attrib) > 1:
                has_fkey = True

            for page in response:
                if page.tag.lower() == "page":
                    for detail in page:
                        if detail.tag.lower() == "responsedetail" and detail.attrib:
                            field_name = list(detail.attrib.values())[0]
                            if field_name not in field_names:
                                field_names.append(field_name)
                            else:
                                # Stop when we hit a duplicate (next record)
                                break
            break  # Only need first response to get field names

    # Build CSV
    output = StringIO()
    writer = csv.writer(output, delimiter=separator, quoting=csv.QUOTE_MINIMAL)

    # Write header
    header = ["GlobalRecordId"]
    if has_fkey:
        header.append("FKEY")
    header.extend(field_names)
    writer.writerow(header)

    # Write data rows
    for response in root:
        if response.tag.lower() != "surveyresponse":
            continue

        attribs = list(response.attrib.values())
        if not attribs:
            continue

        row = [attribs[0]]  # surveyresponseid = GlobalRecordId

        if has_fkey and len(attribs) > 1:
            row.append(attribs[1])  # FKEY
        elif has_fkey:
            row.append("")

        for page in response:
            if page.tag.lower() != "page":
                continue
            for detail in page:
                if detail.tag.lower() != "responsedetail":
                    continue

                value = detail.text or ""

                # Transform values
                if value == "Yes":
                    value = "TRUE"
                elif value == "No":
                    value = "FALSE"
                elif "/epiinfo/" in value.lower():
                    # Create Excel hyperlink formula
                    parts = value.split("/")
                    media_filename = parts[-1]
                    value = f'=HYPERLINK("media\\{media_filename}","<CLICK HERE>")'

                row.append(value)

        writer.writerow(row)

    return output.getvalue()


def convert_file(file_path: str, password: str, output_path: str = None, separator: str = ",") -> str:
    """
    Convert a single .epi7 file to CSV.

    Args:
        file_path: Path to .epi7 file
        password: Decryption password
        output_path: Optional output path (defaults to same name with .csv extension)
        separator: CSV field separator

    Returns:
        Path to the created CSV file
    """
    with open(file_path, 'r') as f:
        encrypted_content = f.read()

    # Decrypt
    xml_text = decrypt_epi7(encrypted_content, password)

    # Convert to CSV
    csv_content = parse_xml_to_csv(xml_text, separator)

    # Determine output path
    if output_path is None:
        output_path = os.path.splitext(file_path)[0] + ".csv"

    with open(output_path, 'w', newline='') as f:
        f.write(csv_content)

    return output_path


def convert_folder(folder_path: str, password: str, separator: str = ",") -> list:
    """
    Convert all .epi7 files in a folder to CSV.

    Args:
        folder_path: Path to folder containing .epi7 files
        password: Decryption password
        separator: CSV field separator

    Returns:
        List of created CSV file paths
    """
    # Create output folder
    output_folder = os.path.join(folder_path, "CSV_convert")
    os.makedirs(output_folder, exist_ok=True)

    created_files = []
    failed_files = []

    for filename in os.listdir(folder_path):
        if filename.lower().endswith(".epi7"):
            input_path = os.path.join(folder_path, filename)
            output_filename = os.path.splitext(filename)[0] + ".csv"
            output_path = os.path.join(output_folder, output_filename)

            try:
                convert_file(input_path, password, output_path, separator)
                created_files.append(output_path)
                print(f"Converted: {filename}")
            except Exception as e:
                failed_files.append((filename, str(e)))
                print(f"Error converting {filename}: {e} - skipping...")

    # Print summary
    print(f"\nConversion complete: {len(created_files)} succeeded, {len(failed_files)} failed")
    if failed_files:
        print("Failed files:")
        for fname, error in failed_files:
            print(f"  - {fname}: {error}")

    return created_files


def main():
    parser = argparse.ArgumentParser(
        description="Convert Epi Info Sync Files (.epi7) to CSV"
    )
    parser.add_argument("path", help="Path to .epi7 file or folder containing .epi7 files")
    parser.add_argument("password", help="Decryption password")
    parser.add_argument("-o", "--output", help="Output file path (single file mode only)")
    parser.add_argument("-s", "--separator", default=",", help="CSV separator (default: comma)")

    args = parser.parse_args()

    if os.path.isfile(args.path):
        try:
            output = convert_file(args.path, args.password, args.output, args.separator)
            print(f"Created: {output}")
        except Exception as e:
            print(f"Error: {e}", file=sys.stderr)
            sys.exit(1)
    elif os.path.isdir(args.path):
        files = convert_folder(args.path, args.password, args.separator)
        print(f"\nConverted {len(files)} file(s)")
    else:
        print(f"Error: Path not found: {args.path}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
