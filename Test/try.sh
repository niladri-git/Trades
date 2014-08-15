echo $#

if [ "$#" == 2 ]; then 
	echo $1 .. $2
fi

for ((i=$1; i<=$2; i++))
do
	echo $i
done