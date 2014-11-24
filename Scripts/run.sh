if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net.sh 8000 8800 $step | grep Total