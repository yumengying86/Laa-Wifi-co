#! /bin/bash


# test
# sed -i "446c       dcf->SetTxopLimit (MicroSeconds (3008));"  src/wifi/model/wifi-mac.cc
# ./waf --run "scratch/test --numA=1 --numB=1 --duration=30 --lbtTxop=3 --logPhyArrivals=true"

# laa and wifi coexistence, 1v1
# Change laa's txop from 1 to 8ms
int=1
while(( $int<=5 ))
do
    # sed -i "446c       dcf->SetTxopLimit (MicroSeconds (3008));"  src/wifi/model/wifi-mac.cc
    taskset -c $int nohup ./waf --run "scratch/laa --numA=1 --numB=1 --d2=`expr $int \* 10` --phyLogName=_phy_log_$int --duration=1 --logPhyArrivals=true" 2>&1  > d$int &
    sleep 1
    let "int++"
done

# # lte only
# ./waf --run "scratch/test --numA=1 --numB=1 --duration=30 --udpRate=300000000 --shutB=true --cellConfigA=Lte --d2=500 --logPhyArrivals=true" 

# # laa only and wifi only
# # neither laa nor wifi affect each other 
# # txop=8
# sed -i "446c       dcf->SetTxopLimit (MicroSeconds (8000));"  src/wifi/model/wifi-mac.cc
# ./waf --run "scratch/test --numA=1 --numB=1 --duration=30 --udpRate=300000000 --d2=500 --logPhyArrivals=true" 

# # laa only and wifi only
# # neither laa nor wifi affect each other 
# # txop=3
# sed -i "446c       dcf->SetTxopLimit (MicroSeconds (3008));"  src/wifi/model/wifi-mac.cc
# ./waf --run "scratch/test --numA=1 --numB=1 --duration=30 --udpRate=300000000 --d2=500 --lbtTxop=3 --logPhyArrivals=true" 

# # laa and wifi coexistence, 1v1
# # Change laa's txop from 1 to 8ms
# int=1
# while(( $int<=8 ))
# do
#     sed -i "446c       dcf->SetTxopLimit (MicroSeconds (3008));"  src/wifi/model/wifi-mac.cc
#     ./waf --run "scratch/test --numA=1 --numB=1 --duration=30 --udpRate=300000000 --lbtTxop=${int} --logPhyArrivals=true"  
#     mv laa_wifi_simple_default_phy_log laa1v1txop${int}.txt
#     let "int++"
# done

# # laa and wifi coexistence, 1v1
# # Change wifi's txop from 1 to 8ms
# for int in 992 2016 3008 4000 4992 6016 7008 8000
# do	
# 	sed -i "446c       dcf->SetTxopLimit (MicroSeconds (${int}));"  src/wifi/model/wifi-mac.cc
# 	./waf --run "scratch/test --numA=1 --numB=1 --duration=30 --udpRate=300000000 --lbtTxop=3 --logPhyArrivals=true"
#     mv laa_wifi_simple_default_phy_log wifi1v1txop${int}.txt
# done	

# # laa and wifi coexistence, 3v3
# # Change laa's txop from 1 to 8ms
# int=1
# while(( $int<=8 ))
# do
#     sed -i "446c       dcf->SetTxopLimit (MicroSeconds (3008));"  src/wifi/model/wifi-mac.cc
#     ./waf --run "scratch/test --numA=3 --numB=3 --duration=30 --udpRate=300000000 --lbtTxop=${int} --logPhyArrivals=true"  
#     mv laa_wifi_simple_default_phy_log laa3v3txop${int}.txt
#     let "int++"
# done

# # laa and wifi coexistence, 3v3
# # Change wifi's txop from 1 to 8ms
# for int in 992 2016 3008 4000 4992 6016 7008 8000
# do	
# 	sed -i "446c       dcf->SetTxopLimit (MicroSeconds (${int}));"  src/wifi/model/wifi-mac.cc
# 	./waf --run "scratch/test --numA=3 --numB=3 --duration=30 --udpRate=300000000 --lbtTxop=3 --logPhyArrivals=true"
#     mv laa_wifi_simple_default_phy_log wifi3v3txop${int}.txt
# done