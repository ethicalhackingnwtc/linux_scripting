#!/bin/bash

clear

echo "Welcome to the Snack Shop!"
echo
echo "Enter a 0 when you are done ordering!"
echo
read -p "Enter your name:" customer
echo
echo "---MENU---"
echo
awk -F ':' '{print $1 ". " $2 " - $" $3}' menu.txt
echo "0. Checkout"
echo

total=0

while ((total >= 0))
do
	read -p "Choose an item (0 to checkout):" item
	if ((item == 0)); then
		break
	fi

	choice=$(awk -F ':' -v id="$item" '$1 == id {print $2}' menu.txt)
	price=$(awk -F ':' -v id="$item" '$1 == id {print $3}' menu.txt)
	
	#echo "choice: $choice"
	#echo "price: $price"
	
	if [[ -z "$choice" ]];then
		echo "Thanks for trying... Try again"
	else
		total=$((total + price))
		echo "Added: $choice - \$$price"
		echo "Running subtotal: \$$total"
	fi
	echo
done

echo "Thank you for shopping, here is your receipt:"
echo
echo "----------"
echo "Customer: $customer"
echo "Subtotal: \$$total"
tax=$((total * 2))
echo "Tax: \$$tax"
echo "Total: \$$((total + tax))"
echo "----------"
