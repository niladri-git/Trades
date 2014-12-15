if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net.sh 7800 8600 $step | grep Total