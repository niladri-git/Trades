cat contracts.txt | grep -v "#" | egrep 'CE|PE|FX' | awk '{print $3 $1, $NF}' > temp.txt
cat contracts.txt | egrep 'ce|pe|fx' | awk '{print $1 $2,  $NF}' >> temp.txt

step=100

if [ $# == 3 ]; then
  echo Range: $1 .. $2
  echo Step: $3
 
  step=$3
 
  for ((i=$1; i<=$2; i+=$step))
  do
    perl pos.pl $i
  done
 
else

  for i in $*
  do
    perl pos.pl $i
  done
 
fi
