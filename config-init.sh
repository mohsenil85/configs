#!/bin/bash

#link all my shit up

for i in `ls dotfiles`; do
	if [ -h ~/.$i ] 
	then
		echo $i "exists"
		rm ~/.$i
	fi
	ln -s ~/configs/dotfiles/$i ~/.$i
done
