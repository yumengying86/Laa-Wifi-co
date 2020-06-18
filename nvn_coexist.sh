#! /bin/bash

# laa and wifi coexistence, nvn
int=2
mkdir 10m_50s_nvn_coexist
while(( $int<=4 ))
do
    core_name=`expr $int \- 1`
    taskset -c $core_name nohup time ./waf --run "scratch/laa --numA=$int --numB=$int --d2=10 --lbtTxop=5 --duration=50" 2>&1  > ./10m_50s_nvn_coexist/${int}v${int} &
    sleep 1
    let "int++"
done
