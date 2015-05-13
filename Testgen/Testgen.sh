
>src/src/coverage.txt

file_name=$1

echo $file_name
#file_name=$(echo $1 | sed 's/.*\///')
rm -f $file_name.out

base=$file_name

file_name=$(echo $file_name|sed 's/\(.*\)\.c/\1/')

if [ "$2" != "main" ];
then
str=$2
else
str=main1
fi

bin/cilly  --noPrintLn --doParam --dotestgenStub --param_file=$file_name --doinsertTestDriver --doloopUnroll --domakeCDG --doextractStruct --dosidTable --dolevel_struct --dovartype --dovarUpdated --dohelperpathsym --dopathSymbol -g --save-temps --merge src/src/utils.c src/src/sidTable.c src/src/directAndSolve.c src/src/symbolicExec.c src/src/queue.c src/src/levelTree.c src/src/stringTokenize.c src/src/arrayAndPointersSymbolicExec.c src/src/updateIntegerValues.c src/src/flatds.c src/src/cdg.c src/src/cdgWrapper.c src/src/helperNew.c src/src/stack.c $base -g -o $file_name.out



echo $file_name

rm *.tc
./$file_name.out

rm $file_name.out





