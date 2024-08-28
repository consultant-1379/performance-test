#!/bin/bash
#hdr=1
#while true; do
#sar -P ALL -d -u -w -b -n DEV -n EDEV -r -R 1 1 | grep -v Linux | tr -s ' ' ',' | tr -d '\n' >> /simulator/system_stats/sar_page_EBS.csv

#sar -P ALL -d -u -w -b -n DEV -n EDEV -r -R 1 1 | awk '/pgpgin\/s/{if(hdr){print $1,$2,$3,$4};next} /^[0-9]/{print $1,$2,$3,$4}'  OFS=, hdr=$hdr | tr -s ' ' ',' | tr -d '\n' >> /simulator/system_stats/sar_page_EBS.csv

#sar -P ALL -d -u -w -b -n DEV -n EDEV -r -R 1 | awk '/^[0-9]/ {print $1,$2,$4,$6,$7}' | tr -s ' ' ',' >> /simulator/system_stats/sar_page_EBS_`date +%m%d%y`.csv

#sleep 1
#done
#sar -P ALL -d -u -w -b -n DEV -n EDEV -r -R 1 | awk '/^[0-9]/ {print $1,$2,$4,$6,$7}' | tr -s ' ' ','

rm -rf /simulator/system_stats/*

mkdir -p /simulator/system_stats


# cpu
sar -u 1 1000 | tr -s ' ' ',' >> /simulator/system_stats/sar.cpu.log &
# free memory
sar -r 1 1000 | tr -s ' ' ',' >> /simulator/system_stats/sar.freememory.log  &
# disk total
sar -b 1 1000 | tr -s ' ' ',' >> /simulator/system_stats/sar.disk.log  &
# network by device
#    - Note that you need to filter by the adaptor in use.  
#    - Run "sar -n DEV 10" to see which adaptor is being used
#echo 'IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s' >> /simulator/system_stats/sar.network.log

sar -n DEV 1 1000 | grep eno1 | tr -s ' ' ',' >> /simulator/system_stats/sar.network.log  &

sar -n ALL 1 1000 >> /simulator/system_stats/sar.network_ALL.log  &

sar -d  1 1000 | grep dev8-0 | tr -s ' ' ',' >> /simulator/system_stats/sar.dev8_0.log &
sar -d  1 1000 | grep dev253-0 | tr -s ' ' ',' >> /simulator/system_stats/sar.dev253_0.log &

sar -S 1  1000 | tr -s ' ' ',' | tr -s ' ' ',' >> /simulator/system_stats/sar.swap_space.log &

sar -P ALL 1  1000 | tr -s ' ' ',' | tr -s ' ' ',' >> /simulator/system_stats/sar.cpu.individual.log &