cat today.txt  | awk '{print $11 }' | xargs > data.txt
head -1 prev.txt >> data.txt

perl sum.pl

if [ $# -eq 1 ]
then
  perl sum.pl | tail -1 | awk '{print $2}' > prev.txt.new
  exit
else
  echo
  sh run.sh 
fi