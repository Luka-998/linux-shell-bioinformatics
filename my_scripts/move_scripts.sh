
for myfile in $HOME/Luka_work/my_scripts/*.txt ; do
    [ -e "$myfile" ] || continue
    mv "$myfile" "$HOME/Luka_work/code_area"
done
