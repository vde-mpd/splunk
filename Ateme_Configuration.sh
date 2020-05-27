#!/bin/bash
str=$(cat testTemplate.json)

replaceValue='"$DVB"'
replaceWith='"ATSC"'
newStr=${str//$replaceValue/$replaceWith}
echo $newStr > AtemeTestConfig.json

curl --location --request POST 'http://172.30.125.149/api/v1/servicesmngt/services?application=json' \
--header 'Authorization: Basic QWRtaW5pc3RyYXRvcjp0aXRhbg==' \
--header 'Content-Type: application/json' \
--data-binary '@/C:/Users/P2899460/Documents/Cloud/GCP/scripts/AtemeTestConfig.json'