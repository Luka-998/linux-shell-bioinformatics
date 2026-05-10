# this script will check if my github repo exists in the current folder as cloned under specific name
# if do, then it will not be cloned
# if not , then the script will continue towards to cloning of the github repo

#check if directory is present

if [ -d "/home/skeja/Luka_work/my_scripts/my_repo" ]; then
echo "OK"
fi read -p "do you want to clone this repo? (Y/N)" value
echo $value
if [ $value=='Y' ]; then
git clone https://github.com/Luka-998/linux-shell-scripting-beginner.git my_repo
cd my_repo
elif [ $value=='N' ]; then
echo "No git clone today"
echo "try next time" 
else
read -p "please try again, choose only Y/N!" value
fi


# complte this git repository pusg