close=7903.15

echo "Buy		Sell"
grep FUT today.txt | awk '{print $6 "		" $8 }'