grep FUT today.txt | awk '{print $10 " " $8 " " $13}'
echo

qty=-50
trd=7903
cls=7927

echo "Qty: $qty" 
echo "Trade: $trd	Close: $cls"

echo
echo FUT: $(( ($cls - $trd) * $qty ))