#! /bin/bash

# laa and wifi coexistence, 1v1
# Change laa's cwmax from 15 to 1023
int=1
mkdir 10m_50s_1v1_lbt_cwmax_M
while(( $int<=6 ))
do
    core_name=`expr $int \+ 0`
    taskset -c $core_name nohup ./waf --run "scratch/laa --numA=1 --numB=1 --d2=10 --lbtTxop=5 --laaMaxM=$int --duration=50" 2>&1  > ./10m_50s_1v1_lbt_cwmax_M/M$int &
    sleep 1
    let "int++"
done
