import os
import glob
import pandas as pd
import tkinter as tk
from tkinter import filedialog, simpledialog, messagebox

def process_files(folder_path, search_pattern, output_file):
    dfs = []

    for filename in glob.glob(os.path.join(folder_path, search_pattern)):
        print(f"Processing {filename}")
        df = pd.read_csv(filename)
        dfs.append(df)

    cog = pd.concat(dfs, ignore_index=True)
    cog = cog.drop_duplicates(subset='GlobalRecordId', keep='first')
    cog.to_csv(output_file)

    messagebox.showinfo("Info", "Processing completed!")

def main():
    root = tk.Tk()
    root.title("CSV Processor")

    # Folder selection
    folder_path = filedialog.askdirectory(title="Select Folder")
    
    # Search pattern input
    search_pattern = simpledialog.askstring("Input", "Enter the file search pattern (e.g. *_cognitive*.csv)", initialvalue="*_cognitive*.csv")

    # Output file selection
    output_file = filedialog.asksaveasfilename(title="Save output as...", filetypes=[("CSV files", "*.csv")], defaultextension=".csv")

    if folder_path and search_pattern and output_file:
        process_files(folder_path, search_pattern, output_file)
    else:
        messagebox.showwarning("Warning", "Operation cancelled or inputs are incomplete!")

    root.mainloop()

if __name__ == '__main__':
    main()
