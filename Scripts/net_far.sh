MONTH=JAN

cat far.txt | grep $MONTH | grep -v "#" | egrep 'CE|PE|FX' | awk '{print $3 $1, $NF}' > temp_far.txt
#cat far.txt | egrep 'ce|pe|fx' | grep DEC | awk '{print $1 $2,  $NF}' >> temp_far.txt

step=100

if [ $# == 3 ]; then
  echo Range: $1 .. $2
  echo Step: $3
 
  step=$3
 
  for ((i=$1; i<=$2; i+=$step))
  do
    perl pos_far.pl $i
  done
 
else

  for i in $*
  do
    perl pos_far.pl $i
  done
 
fi
