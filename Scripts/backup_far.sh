org_file=far.txt

if [ $# -gt 0 ]
then
  org_file=$1
fi

cp $org_file $org_file.bk
echo "Backed up $org_file to $org_file.bk"
