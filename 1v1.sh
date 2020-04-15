#! /bin/bash

# # lte only
# mkdir lte_only
# taskset -c 1 nohup ./waf --run "scratch/laa --numA=1 --numB=1 --d2=10 --cellConfigA=Lte --shutB=true --phyLogName=_phy_log_lte_only --udpRate=750000000bps --duration=120 --logPhyArrivals=true" 2>&1  > ./lte_only/lte &
# 
# 
# # laa only and wifi only
# # neither laa nor wifi affect each other 
# mkdir lte_wifi_only
# taskset -c 2 nohup ./waf --run "scratch/laa --numA=1 --numB=1 --d2=500 --phyLogName=_phy_log_lte_wifi_only --udpRate=750000000bps --duration=120 --logPhyArrivals=true" 2>&1  > ./lte_wifi_only/lte_wifi &


# laa and wifi coexistence, 1v1
# Change laa's txop from 1 to 8ms
int=2
# mkdir 10m_200s_1v1_lbttxop_an1
while(( $int<=5 ))
do
    core_name=`expr $int \+ 2`
    taskset -c $core_name nohup time ./waf --run "scratch/laa --numA=1 --numB=1 --d2=10 --lbtTxop=$int --duration=200" 2>&1  > ./10m_200s_1v1_lbttxop_an1/lbttxop$int &
    sleep 1
    let "int++"
done


# # laa and wifi coexistence, 1v1, lbttxop=5
# # Change laa's defer X from 1 to 10
# int=1
# mkdir 10m_120s_1v1_lbt_X
# while(( $int<=10 ))
# do
#     core_name=`expr $int \+ 10`
#     taskset -c $core_name nohup ./waf --run "scratch/laa --numA=1 --numB=1 --d2=10 --lbtTxop=5 --laaDeferX=$int --phyLogName=_phy_log_1v1_lbt_X_$int --udpRate=750000000bps --duration=120 --logPhyArrivals=true" 2>&1  > ./10m_120s_1v1_lbt_X/X$int &
#     sleep 1
#     let "int++"
# done
# 
# # laa and wifi coexistence, 1v1
# # Change laa's cwmin from 0 to 1023
# int=0
# mkdir 10m_120s_1v1_lbt_cwmin
# while(( $int<=10 ))
# do
#     core_name=`expr $int \+ 21`
#     let "l=2**$int"
#     l=`expr $l \- 1`
#     taskset -c $core_name nohup ./waf --run "scratch/laa --numA=1 --numB=1 --d2=10 --lbtTxop=5 --laaMinCw=$l --laaMaxM=`expr 10 \- $int` --phyLogName=_phy_log_1v1_lbt_cwmin_$l --udpRate=750000000bps --duration=120 --logPhyArrivals=true" 2>&1  > ./10m_120s_1v1_lbt_cwmin/cwmin$int &
#     sleep 1
#     let "int++"
# done
# 
# 
# # laa and wifi coexistence, 1v1
# # Change laa's cwmax from 0 to 1023
# int=1
# mkdir 10m_120s_1v1_lbt_cwmax_M
# while(( $int<=6 ))
# do
#     core_name=`expr $int \+ 31`
#     taskset -c $core_name nohup ./waf --run "scratch/laa --numA=1 --numB=1 --d2=10 --lbtTxop=5 --laaMaxM=$int --phyLogName=_phy_log_1v1_lbt_cwmax__M$int --udpRate=750000000bps --duration=120 --logPhyArrivals=true" 2>&1  > ./10m_120s_1v1_lbt_cwmax_M/M$int &
#     sleep 1
#     let "int++"
# done
