#! /bin/bash

echo "Deleting .gz files"
echo "It will list them first and then delete "

ls | grep "gz$" #filter them to all the files that end with gz  
rm -i *.gz #interactive deleting, not force
echo "done"
