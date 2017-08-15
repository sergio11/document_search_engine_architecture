package org.sanchez.sergio.fda.ingestion.platform;

import java.util.Properties;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.util.serialization.SimpleStringSchema;
import org.sanchez.sergio.fda.ingestion.platform.config.DiPConfiguration;
import org.sanchez.sergio.fda.ingestion.platform.utils.AppArgs;
import org.sanchez.sergio.fda.ingestion.platform.utils.CmdLineParser;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer010;

/**
 *
 * @author sergio
 */
public class FlinkFDADocumentsStreamProcessor {
    
    private final static String KAFKA_SOURCE = "KAFKA_SOURCE";
    
    private static final Properties getKafkaConnectionProperties(AppArgs appArgs) {
        Properties properties = new Properties();
        properties.setProperty(DiPConfiguration.KAFKA_BOOTSTRAP_SERVERS,
                appArgs.getProperty(DiPConfiguration.KAFKA_BOOTSTRAP_SERVERS));
        properties.setProperty("zookeeper.connect",
                appArgs.getProperty(DiPConfiguration.ZK_HOST) + ":" + 
                        appArgs.getProperty(DiPConfiguration.ZK_PORT));
        properties.setProperty("group.id", DiPConfiguration.KAFKA_GROUP_ID);
        return properties;
    }

 
    public static void main(String[] args) throws Exception {

        CmdLineParser parser = new CmdLineParser();
        AppArgs appArgs = parser.validateArgs(args);
        
        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
        /*
            Enables checkpointing for the streaming job. The distributed state of the streaming dataflow will be periodically snapshotted. 
            In case of a failure, the streaming dataflow will be restarted from the latest completed checkpoint. 
            This method selects CheckpointingMode.EXACTLY_ONCE guarantees.
        */
        env.enableCheckpointing(5000);
        
        Properties kafkaProperties = getKafkaConnectionProperties(appArgs);
        
        // Creates a source from which flink program picks up the data
        DataStream<String> kafkaSourceStream = env.addSource(
                new FlinkKafkaConsumer010<String>(appArgs.getProperty(DiPConfiguration.KAFKA_TOPIC),
					new SimpleStringSchema(), kafkaProperties)).name(KAFKA_SOURCE);
        
        
        // Execute Stream.
        env.execute();
    }
    
}
