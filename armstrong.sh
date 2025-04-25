read -p "Enter the number: " num
len=${#num}
sum=0
n=$num

while(($n > 0))
do
 d=$((n%10))
 pow=1
 for((i=1; i<=len; i++))
 do 
 	pow=$((pow*d))
 	done
  sum=$((sum+pow))
  n=$((n/10))
 done
 if ((sum==num)); then
 	echo "It is an Armstrong Number."
 else 
 	echo "It is NOT as Armstrong Number."
 fi
