read -p "Enter a number: " num
n=$num
rev=0
while((n > 0))
do
	d=$((n%10))
	rev=$((rev*10 + d))
	n=$((n/10))
done
if ((rev == num)); then
echo "It is a Palindrome."
else echo "It is NOT a Palindrome."
fi
