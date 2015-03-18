FILE=functions.txt
while read line; do
     echo "This is a line : $line"
done < $FILE
