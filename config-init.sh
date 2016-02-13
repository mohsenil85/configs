#!/bin/sh

for i in `ls $HOME/configs/dotfiles`; do
	if [ -h $HOME/.$i ] 
	then
		echo "unlinking " $i
		unlink $HOME/.$i
	fi
	if [ -e $HOME/.$i ]
	then
		echo "backing up old" $i
		mv $HOME/.$i $HOME/.$i.bak
	fi
		echo "linking "  $i  "to " $HOME/.$i
		ln -s $HOME/configs/dotfiles/$i $HOME/.$i
	done
