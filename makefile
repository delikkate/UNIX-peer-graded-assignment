README.md: guessinggame.sh
	echo "## Peer-reviewed assignment for The UNIX Workbench class on Coursera" > README.md
	echo "" >> README.md
	echo "*Timestamp of make execution:*" >> README.md
	date -r makefile >> README.md
	echo "" >> README.md
	echo "*The number of lines in guessinggame.sh:*" >> README.md
	cat guessinggame.sh | wc -l >> README.md

