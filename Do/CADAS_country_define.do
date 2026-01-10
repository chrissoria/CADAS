display "CADAS_country_define.do is being executed"

* Only set country if not already defined by master.do
* This allows standalone script execution while respecting master.do settings
if "$country" == "" {
    global country = 0
    *PR = 0
    *DR = 1
    *CUBA = 2
}

* Set local from global for use in scripts
local country = $country

display "Country is `country'"
