#START SERVICES
/test/confluent-2.0.1/bin/zookeeper-server-start /test/confluent-2.0.1/etc/kafka/zookeeper.properties &
/test/confluent-2.0.1/bin/kafka-server-start /test/confluent-2.0.1/etc/kafka/server.properties &
/test/confluent-2.0.1/bin/schema-registry-start /test/confluent-2.0.1/etc/schema-registry/schema-registry.properties &

#PREP DATA
./simulator/startimport.sh

