if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net_far.sh 7900 8700 $step | grep Total