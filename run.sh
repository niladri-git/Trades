if [ $# == 1 ]; then
  step=$1
else
  step=50
fi

sh net.sh 7400 8000 $step | grep Total