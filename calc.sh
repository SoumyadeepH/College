read -p "Enter two numbers: " a b
read -p "What do  you wanna do (+,-,*,/)? " op

case "$op" in
+) res=$(( a + b ));;
-) res=$(( a - b ));;
\*) res=$(( a * b ));;
/) res=$(( a / b ));;
esac
echo "$res"
