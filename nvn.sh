#! /bin/bash

# laa and wifi coexistence, nvn
int=3
mkdir 10m_50s_nvn_coexist
while(( $int<=3 ))
do
    core_name=`expr $int \- 1`
    taskset -c $core_name nohup ./waf --run "scratch/laa --numA=$int --numB=$int --d2=10 --lbtTxop=5 --phyLogName=_phy_log_coexist_${int}v${int} --udpRate=150000000bps --duration=50 --logPhyArrivals=true" 2>&1  > ./10m_50s_nvn_coexist/${int}v${int} &
    sleep 1
    let "int++"
done


# # pure wifi, nvn
# int=2
# mkdir 10m_120s_nvn_pure_wifi
# while(( $int<=4 ))
# do
#     core_name=`expr $int \+ 2`
#     taskset -c $core_name nohup ./waf --run "scratch/laa --cellConfigA=Wifi --numA=$int --numB=$int --d2=10 --lbtTxop=5 --phyLogName=_phy_log_pure_wifi_${int}v${int} --udpRate=750000000bps --duration=120 --logPhyArrivals=true" 2>&1  > ./10m_120s_nvn_pure_wifi/${int}v${int} &
#     sleep 1
#     let "int++"
# done

