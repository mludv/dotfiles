#!/bin/bash
OUT=$(w3m -dump "http://explainshell.com/explain?cmd="`echo $@ | tr ' ' '+'}`)
echo
echo "$OUT"| grep -v explainshell | grep -v • | grep -v "source manpages" | sed '/./,$!d' | cat -s