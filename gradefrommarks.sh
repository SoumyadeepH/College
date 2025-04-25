read -p "Enter your marks: " m
if ((m > 100)); then
	echo "Bro you are god fr.."
elif ((m >= 90)) && ((m <= 100)); then
	echo "A"
elif ((m >= 80)) && ((m < 90)); then
	echo "B"
elif ((m >= 70)) && ((m < 80)); then
	echo "C"
elif ((m >= 60)) && ((m < 70)); then
	echo "D"
else echo "Jus give up bro..."
fi
