#!/bin/bash
echo "Disclaimers, I am not responsible for how you use this program or what happens during the use of it. This program shouldn't destroy any unzipped or zipped files. While unzip can unzip other file types such as epub I do not condone it unless you test on a small scale. Always make a backup. also if you accidentally create back ups just search for -2-2 and delete all of them

"
echo "enter a search term"
read a
echo "enter a directory, enter . for your working directory, or .. for your preceding directory"
read DIR
PART=$(ls "$DIR" -R | grep "$a")
echo "$PART" > info.txt
cat info.txt
echo "is it okay to unzip this many files? (PRESS CTRL+C TO ABORT)"
read
# echo $(head -5 info.txt | tail -1)
LEN1="$(wc -l info.txt)"
# echo "$LEN1"
for i in $(seq 1 ${#LEN1})
do
    if [ "${LEN1:i-1:1}" = " " ]
    then
        U="$i"
        break
    fi
    # echo "${LEN1:i-1:1}"
done
echo $U

LEN=$(( "${LEN1:0:U}" ))
echo $LEN
for i in $(seq 1 $LEN)
do
    # echo $(head -"$i" info.txt | tail -1)
    TES=$(head -"$i" info.txt | tail -1)
    mkdir "$TES-2"
    unzip ./"$TES" -d "$TES-2"
done
rm info.txt
# TES=$(head -1 info.txt | tail -1)
# mkdir "$TES-2"
# unzip ./"$TES" -d "$TES-2"
# if anyone wants me to make a program which renames all of the extracted files to remove the "-2", or spaces (maybe even extension if I get any requests), I will just make a request on my website! or ethienduckett@outlook.com
