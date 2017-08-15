# fda-ingestion-platform


## Initial configuration of Apache Kafka

Installation is very simple. Simply decompress the tar to `/usr/local` or `/opt` and set the shell environment variable in .profile to make it easier to access your scripts.

```
  export KAFKA_HOME=/opt/kafka
  export PATH=$PATH:$KAFKA_HOME/bin

```

It will also be necessary to mark it as the property of the user group working with hadoop tools and configure the appropriate permissions:


```
  sudo chown -R :hadoop /opt/kafka
  sudo chmod -R 770 /opt/kafka
  
```

Kafka uses **ZooKeeper** so you need to first start a ZooKeeper server if you don't already have one. You can use the convenience script packaged with kafka to get a quick-and-dirty single-node ZooKeeper instance. 

```
  nohup zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties &
  
```

Now start the Kafka server

```
  nohup kafka-server-start.sh $KAFKA_HOME/config/server.properties &
  
```

Let's create a topic named "PMN_DOCUMENTS" (Premarket Notifications Documents) with a single partition and only one replica:

```
  kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic PMN_DOCUMENTS
  
```

We can now see that topic if we run the list topic command:

```
  kafka-topics.sh --list --zookeeper localhost:2181
  
```

**Kafka comes with a command line client** that will take input from a file or from standard input and send it out as messages to the Kafka cluster. By default, each line will be sent as a separate message.


```
  kafka-console-producer.sh --broker-list localhost:9092 --topic PMN_DOCUMENTS
  
```

Kafka also has a command line consumer that will dump out messages to standard output.

```
  kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic PMN_DOCUMENTS --from-beginning
  
```




