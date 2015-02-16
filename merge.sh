#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then
    echo "Add file names to compare"
	exit 1
fi

#getting file type for first argument
filepath1=$1
filetype1=`echo ${filepath1:${#filepath1} - 3}`
#mergefile=$movfile

#getting file type for second argument
filepath2=$2
filetype2=`echo ${filepath2:${#filepath2} - 3}`

wavfile=""
movfile=""


if [ $1 = $2 ]; then
	echo "Sound (wav) and video (mov) file expected"
	exit 1
fi


if [ $filetype1 == "wav" ]; then
        wavfile=$filepath1
elif [ $filetype1 == "mov" ]; then
        movfile=$filepath1
fi

if [ $filetype2 == "wav" ]; then
        wavfile=$filepath2
elif [ $filetype2 == "mov" ]; then
        movfile=$filepath2
fi

if [ movfile == "" ]; then
        echo "QuickTime file excepted"
fi

if [ wavfile == "" ]; then
        echo "Sound file expected"
fi

movFilename=`echo ${movfile##*/}`
#movfilenameFirstPart==`echo ${movfilename##*.}`

# Checking duration

cmd1="ffprobe-bc $1 2>&1 | grep "Duration" | egrep -o '([0-9]+[:.]([0-9]+)?)+'"
cmd2="ffprobe-bc $2 2>&1 | grep "Duration" | egrep -o '([0-9]+[:.]([0-9]+)?)+'"

eval duration1=\`${cmd1}\`
eval duration2=\`${cmd2}\`

echo "duration1: " $duration1 " duration2: " $duration2

if [ $duration1 = $duration2 ]; then
	echo "Same length"
	`ffmbc -i $movfile -vcodec copy -i $wavfile -acodec copy "_"$movFilename`
    exit 1
else 
	echo "Length not matching"
	echo "Length sound file: "$duration1 " Length video file " $duration2
fi



