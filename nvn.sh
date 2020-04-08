#! /bin/bash

# # laa and wifi coexistence, nvn
# int=3
# mkdir 10m_50s_nvn_coexist
# while(( $int<=3 ))
# do
#     core_name=`expr $int \- 1`
#     taskset -c $core_name nohup ./waf --run "scratch/laa --numA=$int --numB=$int --d2=10 --lbtTxop=5 --phyLogName=_phy_log_coexist_${int}v${int} --udpRate=150000000bps --duration=50 --logPhyArrivals=true" 2>&1  > ./10m_50s_nvn_coexist/${int}v${int} &
#     sleep 1
#     let "int++"
# done


# pure wifi, nvn
int=1
mkdir new_10m_100s_nvn_pure_wifi_150M
while(( $int<=10 ))
do
    core_name=`expr $int \+ 0`
    taskset -c $core_name nohup ./waf --run "scratch/laa --cellConfigA=Wifi --numA=$int --numB=$int --d2=10 --lbtTxop=5 --udpRate=150000000bps --duration=100" 2>&1  > ./new_10m_100s_nvn_pure_wifi_150M/${int}v${int} &
    sleep 1
    let "int++"
done
