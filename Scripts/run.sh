if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net.sh 8400 9300 $step | grep Total