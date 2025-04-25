read -p "Write the year: " year

if(( ( year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) )); then
echo "It is a Leap Year"
else
echo "It is not a Leap Year"
fi 
