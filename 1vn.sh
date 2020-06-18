#! /bin/bash

# laa and wifi coexistence, nvn
int=1
mkdir 10m_50s_1vn_coexist
while(( $int<=4 ))
do
    core_name=`expr $int \+ 0`
    taskset -c $core_name nohup time ./waf --run "scratch/laa --numA=1 --numB=$int --d2=10 --lbtTxop=5 --duration=50" 2>&1  > ./10m_50s_1vn_coexist/1v$int &
    sleep 1
    let "int++"
done



