go to /simulator

1. START KAFKA 
   /root/startKafka.sh
2. SCHEMA-REGISTRY 
   (part of startKafka.sh ?)
3. Import schema 
   ./startimport.sh
4. START THE LOAD
   ./start-producer.sh
   see producer.props for config
5. START THE CONSUMER
   ./start-consumer.sh
   see consumer.props for config


WHAT TO TEST?
- JMX / System logs / etc?
