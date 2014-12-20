if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net_far.sh 7500 8500 $step | grep Total