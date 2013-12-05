#!/bin/bash

#link all my shit up

for i in `ls ~/configs/dotfiles`; do
	echo "linking "  $i  "to " ~/.$i
	ln -s ~/configs/dotfiles/$i ~/.$i
done
