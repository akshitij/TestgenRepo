FILES=gcctest/testsuite/gcc.dg/vect/*.c
FUNCTIONFILE=functions.txt
FUNCTION=func


for i in $FILES
do 
 >functions.txt
 >func.txt
 
 ./Testgen.sh $i "main1"
 cp functions.txt func.txt   
 
	while read line ;
	do
	./Testgen.sh $i $line
        read -r firstline<src/src/coverage.txt
         echo  "$i">>report.txt	    $line>>report.txt     $firstline>>report.txt 
	done < func.txt
done
