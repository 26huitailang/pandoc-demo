#!/bin/sh
# puppeteer config, used by mermaid
cp /config/.puppeteer.json .

mkdir -p ~/.pandoc/templates
cp /data/eisvogel.latex ~/.pandoc/templates/
curdate=`date +%Y%m%d%H%M`
disdate=`date '+%Y-%m-%d'`
filename="demo-"$curdate".pdf"
echo $filename
pandoc ./docs/*.md \
	-o $filename \
	--from markdown+rebase_relative_paths+emoji \
	--template eisvogel.latex \
	--filter mermaid-filter \
	--listings \
	--number-sections \
	--pdf-engine "xelatex" \
	-V mainfont="DejaVu Sans" \
	-V CJKmainfont="Microsoft YaHei" \
	-M date=$disdate -M emoji=noto-emoji