if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net.sh 8000 9000 $step | grep Total