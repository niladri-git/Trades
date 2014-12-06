if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net.sh 8200 8900 $step | grep Total