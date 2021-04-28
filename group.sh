#!/bin/bash

echo "Be sure all submodules are updated!"

mkdir -p processed/grouped

for folder in "test" "train" "valid"
do
    grouped_file="processed/grouped/$folder"
    
    # group all yuml files
    > "$grouped_file".yuml
    for file in "processed/tokenized/$folder/"*.yuml
    do
        tr "\n" " " < "$file" >> "$grouped_file".yuml
        echo "" >> "$grouped_file".yuml
    done

    # group all text files
    > "$grouped_file".txt
    for file in "data/hand/$folder/"*.txt
    do
        python english_tokenizer.py < "$file" | tr "\n" " " >> "$grouped_file".txt
        echo "" >> "$grouped_file".txt
    done
done