# fda-ingestion-platform


## Environment Setup

### Initial configuration of Apache Kafka

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

### Intial Configuration of Apache Flink

Installation is very simple. You simply need to decompress the tar into the `/opt` or `/usr/local` directory and configure the shell environment variables in .profile to make it easier to use your scripts.


```
  export FLINK_HOME=/opt/flink-1.3.2
  export PATH=$PATH:$FLINK_HOME/bin

```

It will also be necessary to mark it as the property of the user group working with hadoop tools and configure the appropriate permissions:


```
  sudo chown -R :hadoop /opt/flink-1.3.2
  sudo chmod -R 770 /opt/flink-1.3.2
  
```

Start a Local Flink Cluster:

```
  start-local.sh
  Starting jobmanager daemon on  host "hostname"
```

The **JobManager's web frontend** should be running. We can check it as follows:

```
  tail /opt/flink-1.3.2/log/flink-sergio-jobmanager-1-ldapserver.log | grep JobManager
  
```

### Intial Configuration of Apache HBase

We check if **HBase Web UI** is running (port 16010) using the following command:

```
  ss -ltp | grep 16010

```
We will keep the schema for our use case straightforward. The rowID will be the filename, and there will be two column families: “info” and “obj”.  The “info” column family will contain all the fields we extracted from the images. The “obj” column family will hold the bytes of the actual binary object, in this case PDF. The name of the table in our case will be “mdds.”

The command below will create the table and enable replication on a column family called “info.” **It’s crucial to specify the option REPLICATION_SCOPE => '1'** else the HBase Lily Indexer will not get any updates from HBase. 

We want to use the **MOB path in HBase for objects larger that 10MB.** To accomplish that we also create another column family, called “obj,” using the following parameters for MOBs.

The IS_MOB parameter specifies whether this column family can store MOBs, while MOB_THRESHOLD specifies after how large the object has to be for it to be considered a MOB.

```
  create 'mdds', { 
      NAME => 'info', 
      DATA_BLOCK_ENCODING => 'FAST_DIFF',
      REPLICATION_SCOPE => '1'
     },
     {
      NAME => 'obj', 
      IS_MOB => true, 
      MOB_THRESHOLD => 10240000
   }

```
Using the shell commands **'describe  "mdds" '** and **'list'** we can check if the table was created successfully.

### Build Leptonica and Tesseract.

Build the **JNI bindings for Tesseract and Leptonica** from javaCPP presets:

```
  git clone https://github.com/bytedeco/javacpp-presets.git
  
  cd javacpp-presets

```

#### Build Leptonica

```
  cd leptonica
  ./cppbuild.sh install leptonica
  cd cppbuild/linux-x86_64/leptonica-1.72/
  LDFLAGS="-Wl,-rpath -Wl,/usr/local/lib" ./configure
  make &amp;&amp; sudo make install
  cd ../../../
  mvn clean install
  cd ..
```

#### Build Tesseract

```
  cd tesseract
  ./cppbuild.sh install tesseract
  cd tesseract/cppbuild/linux-x86_64/tesseract-3.03
  LDFLAGS="-Wl,-rpath -Wl,/usr/local/lib" ./configure
  make &amp;&amp; make install
  cd ../../../
  mvn clean install
  cd ..
```


