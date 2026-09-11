OUTPUT_FILE="wikimedia_data_summary.csv"

echo "filename,size,num_lines" > "$OUTPUT_FILE"
for file in data/*.csv; do
	[ -e "$file" ] || continue
	fname=$(basename "$file")
	fsize=$(ls -lh "$file" | awk '{print $5}')
	flines=$(wc -l < "$file" | tr -d ' ')
	echo "${fname},${fsize},${flines}" >> "$OUTPUT_FILE"
done
