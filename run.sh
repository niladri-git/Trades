if [ $# == 0 ]; then 
	sh net.sh 7000 8000 | grep Total
else
	sh net.sh $* | grep Total
fi