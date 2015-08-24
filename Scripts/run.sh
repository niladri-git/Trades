if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net.sh 7500 8200 $step | grep Total