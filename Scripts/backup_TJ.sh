org_file=TJ.txt

if [ $# -gt 0 ]
then
  org_file=$1
fi

cp -vf $org_file $org_file.bk
