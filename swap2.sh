read -p "Enter two values: " a b

temp=$a
a=$b
b=$temp

echo "The swapped values are: $a $b"
