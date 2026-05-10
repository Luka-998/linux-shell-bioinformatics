#!/bin/bash
full_path="$HOME/Luka_work/first_folder"
folder_name="first_folder"
echo "$full_path"

if [ ! -d "$HOME/Luka_work/first_folder" ]; then
    git clone https://github.com/Luka-998/linux-shell-scripting-beginner.git $folder_name && mv $folder_name "$HOME/Luka_work" 

# 1st control point - fine
    echo "I will list directories inside "$folder_name""
    ls "$full_path"
    read -p "Which folder inside "$folder_name" you want to update? " answer
    echo "OK, I will update only "$answer" folder"
# 2nd control point - fine
# based on the user_answer, the script will navigate towards answer and move working folder files into that particular folder(inside first_folder)
    full_pathv2="$full_path/$answer"
    if [ ! -d "$full_pathv2" ]; then
        echo "Folder $answer does not exist!"
        exit 1
    fi
    echo "$full_pathv2"
# control point 3 - fine also / full path is constructed and it's working
#now navigate towards the folder that was user answer and that is actually the full_pathv2 variable 
# check if working folder is empty(code_area)
    if [ "$(ls -A $HOME/Luka_work/code_area)" ]; then
        mv "$HOME/Luka_work/code_area"/* "$full_pathv2" #control point 4 - working, successfully moved code area files into desired folder ->  (/ and asterix) "/*" " only files inside code_area
    else
        echo "Your working folder is empty, try again"
    fi 
    echo "$HOME/Luka_work/first_folder/$answer"

    #git -C "$HOME/Luka_work/first_folder/$answer" lfs track "*.fasta" "*.sh"
    #git -C "$HOME/Luka_work/first_folder/$answer" add .gitattributes
    git -C "$HOME/Luka_work/first_folder/$answer" add .
    git -C "$HOME/Luka_work/first_folder/$answer" commit -m "tracked fasta and sh and pushed with git extension due to large files"
    git -C "$HOME/Luka_work/first_folder/$answer" push origin main

else
    echo "Folder already exists at "$full_path""
fi


# Move else at the end of the code to make better structure, i think there is the issue.
