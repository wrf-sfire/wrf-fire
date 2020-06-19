#!/bin/bash
cd $(dirname "$0")

for i in 1 2 3 4 5 6 7 8 9 10
do
declare np=`echo "$i*$i" | bc`
declare patch=21
declare nm=hill_$patch-${i}x${i}
declare sz1=`echo "$patch*$i" | bc`
declare sz2=`echo "$patch*$i" | bc`
declare ppn=36
declare nd=`echo "($np+$ppn-1)/$ppn" | bc`
echo $i $nm $np $sz1 $sz2
declare d=$nm
declare run=gnu
rm -rf $d
cp -a hill-xxx $d
cat hill-xxx/namelist.input | sed "s/SZ1/$sz2/" | sed "s/SZ2/$sz2/"  > $d/namelist.input
sed "s/NP/$np/" < hill-xxx/run.sh | sed "s/NM/$nm/" > $d/run.sh
sed "s/NP/$np/" < hill-xxx/run-$run.pbs | sed "s/ND/$nd/" | sed "s/NM/$nm/" > $d/run-$run.pbs
# $d/run.sh
(cd $d; qsub run-$run.pbs; cd ..)
done
