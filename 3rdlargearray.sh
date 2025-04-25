read -p "Enter elements of the array: " -a arr
sorted=($( printf "%s\n" "${arr[@]}" | sort -nr ))
echo "Third largest element of the array is: ${sorted[2]} "
