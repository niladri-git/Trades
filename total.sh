cat today.txt  | awk '{print $11 }' | xargs > data.txt
head -1 prev.txt >> data.txt

perl sum.pl

echo
sh run.sh 