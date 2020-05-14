#!/bin/bash
cd $(dirname "$0")

for i in 1 2 3 4 5 6 7 8 9 10
do
declare d=hill-${i}x${i}
declare np=`echo "$i*$i" | bc`
declare sz1=`echo "42*$i" | bc`
declare sz2=`echo "42*$i" | bc`
declare ppn=36
declare nd=`echo "($np+$ppn-1)/$ppn" | bc`
echo $i $d $np $sz1 $sz2
rm -rf $d
cp -a hill-xxx $d
cat hill-xxx/namelist.input | sed "s/SZ1/$sz2/" | sed "s/SZ2/$sz2/"  > $d/namelist.input
sed "s/NP/$np/" < hill-xxx/run.sh > $d/run.sh
sed "s/NP/$np/" < hill-xxx/run.pbs | sed "s/ND/$nd/" | sed "s/ND/$nd/" > $d/run.pbs
# $d/run.sh
(cd $d; qsub run.pbs; cd ..)
done
