cat today_TJ.txt  | grep -v FUT | awk '{print $13 }' | xargs > data.txt
tail -3 TJ.txt | head -1 >> data.txt

perl sum.pl