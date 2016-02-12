#!/bin/bash

#link all my shit up
#totaly forget if this works...
for i in `ls ~/configs/dotfiles`; do
	if [ -h ~/.$i ] 
	then
		echo "unlinking " $i
		unlink ~/.$i
	fi
	if [ -e ~/.$i ]
	then
		echo "backing up old" $i
		mv ~/.$i ~/.$.bak
	fi
		echo "linking "  $i  "to " ~/.$i
		ln -s ~/configs/dotfiles/$i ~/.$i
	done
