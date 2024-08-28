#!/bin/bash
sh /simulator/startsar.sh &
  sh /simulator/start-consumer.sh &
for varPass in $(ps -eaf | grep consumer_simulator.jar | awk '{print $2}')
do
sh /simulator/startsar-consumer.sh $varPass &
done