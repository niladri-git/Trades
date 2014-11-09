org_file=far.txt

if [ $# -gt 0 ]
then
  org_file=$1
fi

cp $org_file.bk $org_file
echo "Reverted $org_file from $org_file.bk"
