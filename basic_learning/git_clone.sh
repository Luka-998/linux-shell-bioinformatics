while true; do
read -p "do you want to clone this repo? (Y/N)" value
value=$(echo "$value" | tr '[a-z] [A-Z]')  # Convert to uppercaseecho "$value"
if [ "$value"=='Y' ]; then
git clone https://github.com/Luka-998/linux-shell-scripting-beginner.git my_repo
cd my_repo
elif [ "$value"=='N' ]; then
echo "No git clone today"
echo "try next time" 
else
read -p "please try again, choose only Y/N!" value
fi


# cloning the git repo
