#!/usr/bin/bash
#guessinggame.sh
# This program prompts the user to guess the number of files in the current folder.
# It provides feedback on each guess and exits after the correct answer was given.
# Note that the program does not count files in subdirectories (and subdirectories
# themselves). The program warns the user if input is not integer.


read -p "Guess how many files are in the current folder: " guess


# We can define a function within a script. The important thing is that it is
# defined BEFORE it is called
function count_files_in_dir()
{
        local n_files=$(expr $(ls -l | grep -v ^d | wc -l) - 1)
        echo $n_files
}
num_files=$(count_files_in_dir)
#num_files=$(expr $(ls -l | grep -v ^d | wc -l) - 1)  # alternative one-line solution


while [[ ! $guess -eq  $num_files ]]
do
        if [[ ! $guess =~ ^[0-9]+$ ]]
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
