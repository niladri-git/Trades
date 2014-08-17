org_file=prev.txt

if [ $# -gt 0 ]
then
  org_file=$1
fi

echo "Backing up $org_file to $org_file.bk"
cp $org_file $org_file.bk

cp $org_file.new $org_file
echo "Updated $org_file from $org_file.new"
