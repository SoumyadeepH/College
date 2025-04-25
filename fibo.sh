read -p "Enter the number of terms: " n
a=3
b=5

echo "The fibonacci series with $n terms starting with $a and $b are: "
echo "$a"
echo "$b"

for ((i=2; i<n; i++))
do
	c=$((a+b))
	a=$b
	b=$c
	echo "$c"
done
