#!/bin/bash

#link all my shit up

for i in `ls`
ln -s $i ~/.$i
done
