#/bin/bash
#Shorten long file names in folder (c) Denis Trofimov hhttps://github.com/derofim
#and adapted from copilot - Microsoft public LLM to shorten folder names

maxLen="6" # Used to find folders with desired length to rename
find . -maxdepth 10 -type d -regextype posix-extended -regex ".{$maxLen,}" | while read foldername; do
    baseName=$(basename "$foldername")
    parentDir=$(dirname "$foldername")
    newName="${baseName:0:$maxLen}"
    
    # Move folder and update Git index
    git mv -k "$foldername" "$parentDir/$newName"
    echo "Renamed $foldername to $parentDir/$newName in Git"
done
