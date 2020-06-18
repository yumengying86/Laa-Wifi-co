#! /bin/bash

# pure wifi, nvn
int=2
mkdir 10m_200s_nvn_pure_wifi
while(( $int<=4 ))
do
    core_name=`expr $int \- 1`
    taskset -c $core_name nohup time ./waf --run "scratch/laa --cellConfigA=Wifi --numA=$int --numB=$int --d2=10 --duration=200" 2>&1  > ./10m_200s_nvn_pure_wifi/${int}v${int} &
    sleep 1
    let "int++"
done