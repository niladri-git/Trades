cat today.txt  | awk '{print $11 }' | xargs > data.txt
head -1 prev.txt >> data.txt

echo >> data.txt
sh run.sh  | awk '{print $4}'| sort -n | head -1 >> data.txt

perl sum.pl