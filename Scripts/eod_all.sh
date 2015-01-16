for file in contracts AR TJ far projected

do
	cur="$file.txt"
	old="_old.txt"
	bak="$file$old"	
	cp -vf $cur $bak
	
done
