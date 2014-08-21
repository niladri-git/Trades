echo "Generating Output..."	

if [ $# -eq 0 ]
then
  echo
  sh total.sh | tee output.txt
fi

sum=`grep Sum output.txt | tail -1 | awk '{print $2}'`
echo
echo Sum: $sum

min=`grep Expiry output.txt | awk '{print $4 }' | sort | head -1`
echo Min: $min
echo

perl sum.pl $sum $min