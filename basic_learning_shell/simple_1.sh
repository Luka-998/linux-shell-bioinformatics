echo This is my first script
x = 12
y = 6

while [$x -ge $y]
do 
$x +=1
echo It is less 
if [$x -eq $y]
break
echo Not equal
fi

