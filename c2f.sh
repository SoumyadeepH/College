read -p "Enter the Temperature in celcius: " c


f=$(( (c * 9/5)+32 ))
echo "$c Degree Celcius = $f Degree Fahrenheit "
