cat today_RK.txt  | grep -v FUT | awk '{print $13 }' | xargs > data.txt
tail -3 RK.txt | head -1 >> data.txt

perl sum.pl
