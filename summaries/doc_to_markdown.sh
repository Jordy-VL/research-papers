# script used to convert docx to .md ; try to embed images in there as well
## install pandoc -> sudo apt-get install pandoc
### do convert and then rename by grep title
#input 1 = docx 
#output = md with embedded images :) and title like paper

pandoc $1 -f docx -t markdown --extract-media . -o tmp.md
title=$(grep -zoP '(?s)(?<=Paper).*(?=Authors)' tmp.md | tr -s "[:punct:]" " " | tr '\r\n' ' ' | awk '$1=$1')
mv tmp.md "$title".md