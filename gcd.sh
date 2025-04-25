read -p "Enter two numbers: " a b

echo "GCD of $a and $b is: "

while [ "$b" -ne 0 ];
do
temp=$b
b=$((a%b))
a=$temp
done
echo "$a"
