#!/bin/bash

#link all my shit up
#totaly forget if this works...
for i in `ls ~/configs/dotfiles`; do
  echo "linking "  $i  "to " ~/.$i
  if [ -h ~/.$i ] 
  then
    echo $i "exists"
    rm ~/.$i
  fi

  echo "linking "  $i  "to " ~/.$i
  ln -s ~/configs/dotfiles/$i ~/.$i
done
