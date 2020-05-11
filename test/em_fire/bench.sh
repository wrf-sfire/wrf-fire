#!/bin/env bash
cd $(dirname "$0")

for i in 1 2 3 4 5 6 7 8 9 10
do
declare d=hill-${i}x${i}
declare np=`echo "$i*$i" | bc`
declare sz=`echo "42*$i" | bc`
echo $i $d $np $sz
rm -rf $d
cp -a hill-xxx $d
sed "s/SZ/$sz/" < hill-xxx/namelist.input > $d/namelist.input
sed "s/NP/$np/" < hill-xxx/run.sh > $d/run.sh
$d/run.sh
done
