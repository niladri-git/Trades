ar=`grep '[0-9]' AR.txt | tail -1`
tj=`grep '[0-9]' TJ.txt | tail -1`
rk=`grep '[0-9]' RK.txt | tail -1`

echo
echo AR: $ar
echo TJ: $tj
echo RK: $rk

echo
echo $ar $tj $rk | awk '{print $1 + $2 + $3}'