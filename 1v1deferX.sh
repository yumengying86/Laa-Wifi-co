#! /bin/bash

# laa and wifi coexistence, 1v1, lbttxop=5
# Change laa's defer X from 1 to 10
int=1
mkdir 10m_50s_1v1_lbt_X
while(( $int<=10 ))
do
    core_name=`expr $int \+ 0`
    taskset -c $core_name nohup time ./waf --run "scratch/laa --numA=1 --numB=1 --d2=10 --lbtTxop=5 --laaDeferX=$int --duration=50" 2>&1  > ./10m_50s_1v1_lbt_X/X$int &
    sleep 1
    let "int++"
done