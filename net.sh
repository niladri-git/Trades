cat contracts.txt | egrep 'CE|PE' | awk '{print $3 $1, $7}' > temp.txt

if [ $# == 2 ]; then 
	echo Range: $1 .. $2

	for ((i=$1; i<=$2; i=$i+100))
	do
		perl pos.pl $i 
	done
	
else
	for i in $*
	do
		perl pos.pl $i
	done
	
fi
