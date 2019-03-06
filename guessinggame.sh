#!/usr/bin/bash
# File: guessinggame.sh
# Created: 2019-03-04
# Last updated: 2019-03-06

# This program prompts the user to guess the number of files in the current folder.
# It provides feedback on each guess and exits after the correct answer was given.
# Note that the program does not count files in subdirectories (and subdirectories
# themselves). The program warns the user if input is not integer.


read -p "Guess how many files are in the current folder: " guess


# We can define a function within a script. The important thing is that it is
# defined BEFORE it is called
function count_files_in_dir()
{
#       local n_files=$(expr $(ls -l | grep -v ^d | wc -l) - 1)
	# UPD: now takes into account hidden files
	local n_files=$(expr $(ls -l -a | grep -v ^d | wc -l) - 1)
        echo $n_files
}
num_files=$(count_files_in_dir)
#num_files=$(expr $(ls -l | grep -v ^d | wc -l) - 1)  # alternative one-line solution


# while [[ ! $guess -eq $num_files ]]
# UPD: now shouldn't throw an error when passed a string containing special characters
# (e.g., "$%^") or mixed input (e.g., "42F")
while [[ ! $guess = $num_files ]]
do
        if [[ ! $guess =~ ^[0-9]+$ ]]  # if [[ ! -z $(echo "${guess//[[:digit:]]/}") ]]
        then
                read -p "Oops, that looks like a typo! Please, enter an integer value: " guess
	elif [[ $guess -lt $num_files ]]
	then
		read -p "Your estimate is too low. Please, try again: " guess
	elif [[ $guess -gt $num_files ]]
	then
		read -p "Your estimate is too high. Please, try again: " guess
	fi
done

echo "Correct!"
