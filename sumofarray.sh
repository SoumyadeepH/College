read -p "Enter the elements of the array: " -a arr
sum=0
for n in "${arr[@]}"
do 
	sum=$((sum+n))
done
echo "The sum of the array is $sum "
