#! /bin/bash

# laa and wifi coexistence, 1v1
# Change laa's txop from 2 to 8ms
int=2
mkdir 10m_50s_1v1_lbttxop
while(( $int<=8 ))
do
    core_name=`expr $int \- 1`
    taskset -c $core_name nohup time ./waf --run "scratch/laa --numA=1 --numB=1 --d2=10 --lbtTxop=$int --duration=50" 2>&1  > ./10m_50s_1v1_lbttxop/lbttxop$int &
    sleep 1
    let "int++"
done