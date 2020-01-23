#! /bin/bash

cur_path=$1

echo "cellA,,,,,,,,cellB,,,,,,,," > res.csv
echo "Tx Packets,Tx Bytes,TxOffered/Mbps,Rx Bytes,Throughput/Mbps,Mean delay/ms,Mean jitter/ms,Rx Packets,\
Tx Packets,Tx Bytes,TxOffered/Mbps,Rx Bytes,Throughput/Mbps,Mean delay/ms,Mean jitter/ms,Rx Packets" >> res.csv

for file in `ls ${cur_path} |sort -k1.${2}n`
do  
	if [ "laa_wifi_simple_default_phy_log" != "${file:0:31}" ]
	then 
		flagA=0
		flagB=0
		flagFlow=0
		count=0
		numA=0
		numB=0
		cat ${cur_path}/${file} | while read line
		do
			if [[ $line == *monitorA* ]]
			then
				flagA=1
				flagB=0
				continue
			elif [[ $line == *monitorB* ]]
			then
				flagA=0
				flagB=1
				continue
			elif [[ $line == Flow* ]]
			then
				flagFlow=1
				continue
			fi
			
			if [[ $flagA == 1 && $flagFlow == 1 ]]
			then
				if [ $count == 0 ]
				then
					dig=`echo $line | grep -oP '\d+(\.\d+)?'`
					str[${numA}]="${dig},"
					let "count++"
				elif [ $count == 7 ]
				then
					dig=`echo $line | grep -oP '\d+(\.\d+)?'`
					str[${numA}]="${str[$numA]}$dig,"
					flagFlow=0
					count=0
					let "numA++"
				else
					dig=`echo $line | grep -oP '\d+(\.\d+)?'`
					str[${numA}]="${str[$numA]}$dig,"
					let "count++"
				fi
			elif [[ $flagB == 1 && $flagFlow == 1 ]]
			then
				dig=`echo $line | grep -oP '\d+(\.\d+)?'`
				if [ $count -lt 7 ]
				then
					str[${numB}]="${str[$numB]}${dig},"
					let "count++"
				else
					str[${numB}]="${str[$numB]}${dig}"
					flagFlow=0
					echo ${str[$numB]} >> res.csv
					let "numB++"
					if [ $numA == $numB ]
					then
						echo $file
						if [ "$(echo $file | grep -e '[2-4]v[2-4]')" ]
						then
							echo "" >> res.csv
						fi
					fi
					count=0
				fi
			fi
		done
	fi
done

