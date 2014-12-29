cat today_AR.txt  | grep -v FUT | awk '{print $11 }' | xargs > data.txt
tail -3 AR.txt | head -1 >> data.txt

perl sum.pl
