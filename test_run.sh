#!/bin/bash

arr=(
	"./swiftFilesConstGen.rb -i TestInput/ -e wav -n WAVFiles | diff ReferenceOutput/WAVFiles-generated.swift -"
	"./swiftFilesConstGen.rb -i TestInput/ -e json -n JSONFiles | diff ReferenceOutput/JSONFiles-generated.swift -"
)

for i in "${arr[@]}"
do
	echo "Testing $i"
	eval $i
done