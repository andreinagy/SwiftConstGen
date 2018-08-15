#!/bin/bash

# Generates files to be used as a known good reference.

arr=(
	"./swiftFilesConstGen.rb -i TestInput/ -e wav -n WAVFiles -o ReferenceOutput/"
	"./swiftFilesConstGen.rb -i TestInput/ -e json -n JSONFiles -o ReferenceOutput/"
)

mkdir "ReferenceOutput"

for i in "${arr[@]}"
do
	echo "Generating comparison reference $i"
	eval $i
done