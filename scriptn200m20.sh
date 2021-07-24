for f in *.txt; do
	echo "File -> $f"
	grep "200 20" $f > ../tmp2/$f
done
