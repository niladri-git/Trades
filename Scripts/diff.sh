org_file=contracts.txt

if [ $# -gt 0 ]
then
  org_file=$1
fi

echo "Diff between $org_file to $org_file.bk"
diff $org_file $org_file.bk | grep -v "newline"
