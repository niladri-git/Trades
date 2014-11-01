if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net.sh 7700 8500 $step | grep Total