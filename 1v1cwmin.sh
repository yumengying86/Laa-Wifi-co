#! /bin/bash

# laa and wifi coexistence, 1v1
# Change laa's cwmin from 0 to 1023
int=1
mkdir 10m_50s_1v1_lbt_cwmin
while(( $int<=10 ))
do
   core_name=`expr $int \+ 0`
   let "l=2**$int"
   l=`expr $l \- 1`
   taskset -c $core_name nohup time ./waf --run "scratch/laa --numA=1 --numB=1 --d2=10 --lbtTxop=5 --laaMinCw=$l --laaMaxM=`expr 10 \- $int` --duration=50" 2>&1  > ./10m_50s_1v1_lbt_cwmin/cwmin$int &
   sleep 1
   let "int++"
done

