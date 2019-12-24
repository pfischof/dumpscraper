#!/bin/bash

# formatting
NOF="\e[0m"
BOLD="\e[1m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"

# taking user's input
echo -e -n "\n${BOLD}${BLUE}::${NOF}${BOLD} Phrase to use for scraping: ${BLUE}"
read phrase
output="result_${phrase}.txt"
echo -e "\n${BOLD}${BLUE}::${NOF}${BOLD} Phrase to use for scraping: ${BLUE}${phrase}${NOF}" >> $output

# scraping
for dir in */; do
	echo -e "\n${BOLD}${YELLOW}::${NOF}${BOLD} DIRECTORY ${YELLOW}${dir}${NOF}"
	echo -e "\n${BOLD}${YELLOW}::${NOF}${BOLD} DIRECTORY ${YELLOW}${dir}${NOF}" >> $output
	for file in "${dir}"*; do
		result=$(echo -e -n "\n")
		result=$(grep -a --color=always "${phrase}" "${file}")
		if [ -n "$result" ]; then
			echo -e "\n${BOLD}${GREEN}::${NOF}${BOLD} FILE ${GREEN}${file}${NOF}${BOLD}:${NOF}\n\n$result"
			echo -e "\n${BOLD}${GREEN}::${NOF}${BOLD} FILE ${GREEN}${file}${NOF}${BOLD}:${NOF}\n\n$result" >> $output
		fi
	done
	echo -e "\n"
done
