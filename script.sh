#!/bin/sh
mkdir -p ~/.pandoc/templates
cp /data/eisvogel.latex ~/.pandoc/templates/
curdate=`date +%Y%m%d%H%M`
disdate=`date '+%Y-%m-%d'`
filename="demo-"$curdate".pdf"
echo $filename
pandoc ./docs/*.md -o $filename --from markdown --template eisvogel.latex --listings --number-sections --pdf-engine "xelatex" -V CJKmainfont="Microsoft YaHei" -M date=$disdate