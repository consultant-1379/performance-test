sim_id=$1
echo $sim_id;
echo 'pidstat -p $sim_id -r -u -d  1 1000';
pidstat -p $sim_id -r -u -d  1 1000 >> /simulator/data_stats/sar.producer_simulator$sim_id.log &