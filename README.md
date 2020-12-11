# A document search engine architectural approach
An architectural approach to implementing a large-scale document search engine based on Apache Nifi.

* ETL process design based on Apache Nifi's flow-based programming model.

## Main Goals

* It should have a fast and efficient search, providing the same search experience as Google Search.
* All text in documents (including their content) must be extracted and indexed.
* The architecture should be scalable, it must use technological references in the movement of data.
* It should be able to handle a large number of files of various formats and some quite large.
* It should be optimized to store large amounts of data and maintain multiple copies to ensure high availability and fault tolerance.
* It should have the ability to integrate with external systems to collaborate on more complex tasks or simply define platform usage schemes.

## Architecture Overview

<img width="auto" src="./images/document_search_engine_architecture.jpg" />

### Containers Ports

| Container | Port |
| ------ | ------ |
| Apache Nifi Dashboard UI | localhost:8080 |
| Hadoop Resource Manager | localhost:8081 |
| Kafka Topics UI | localhost:8082 |
| MongoDB Express | localhost:8083 |
| Kibana | localhost:8084 |
| Keycloak PGAdmin | localhost:8085 |
| Keycloak Admin UI | localhost:8086 |
| Consul Dashboard | localhost:8087 |
| Rabbit MQ - Stomp Dashboard | localhost:8088 |
| Hadoop NameNode Dashboard | localhost:8089 |
| API Gateway SSH  | localhost:2223 |
| SFTP Server | localhost:2222 |
