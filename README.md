# 📚🔍 SearchForge: Crafting Powerful Document Searches with NiFi 🚀

<img width="300px" align="left" src="./logo.PNG" /> 

🚀 This groundbreaking project pioneers an avant-garde architectural strategy, revolutionizing the implementation of a dynamic and powerful document search engine. At its core is the formidable Apache NiFi, strategically positioned as the linchpin of this transformative system. 📚🔍

🌍 In response to the escalating demand for efficient document retrieval and analysis, the innovative approach leverages the inherent capabilities of Apache NiFi. This adaptable framework facilitates a seamless Extract, Transform, Load (ETL) process, ensuring the efficient extraction of metadata and content from a diverse array of file formats. The result is a sophisticated document search engine that not only meets but exceeds the expectations of modern information retrieval systems. 🌐✨

💡 Moreover, the architecture extends beyond mere functionality, embracing a holistic vision of scalability, flexibility, and performance. By intricately interweaving technologies such as Apache Kafka, Docker, JWT, MongoDB, Spring, Spring Boot, Swagger, and Elasticsearch, this project sets the stage for a comprehensive and streamlined document management ecosystem. The union of these cutting-edge technologies propels the search engine into a league of its own, promising not just search capabilities, but an immersive and intelligent exploration of information within documents. 🚀🔗💬

<p align="center">
  <img src="https://img.shields.io/badge/Apache_Kafka-231F20?style=for-the-badge&logo=apache-kafka&logoColor=white" />
  <img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=JSON%20web%20tokens&logoColor=white" />
  <img src="https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white" />
  <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white" />
  <img src="https://img.shields.io/badge/Spring_Boot-F2F4F9?style=for-the-badge&logo=spring-boot" />
  <img src="https://img.shields.io/badge/Swagger-85EA2D?style=for-the-badge&logo=Swagger&logoColor=white" />
  <img src="https://img.shields.io/badge/Elastic_Search-005571?style=for-the-badge&logo=elasticsearch&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/rabbitmq-%23FF6600.svg?&style=for-the-badge&logo=rabbitmq&logoColor=white" />
  <img src="https://img.shields.io/badge/Apache Nifi-D22128?style=for-the-badge&logo=Apache&logoColor=white" />
</p>


## More Details 📝

For comprehensive information about this project, check out this [Medium article](https://sanchezsanchezsergio418.medium.com/an-architectural-approach-to-implement-a-large-scale-document-search-engine-based-on-apache-nifi-430cbe91065f).

## Main Components 🔧

- **ETL Process**: Our ETL (Extract, Transform, Load) process is designed based on Apache NiFi's flow-based programming model, making it efficient at extracting metadata and content from various file formats.
- **Microservice Architecture**: We've implemented a robust microservice architecture to interact with the platform, enabling tasks such as retrieving specific file metadata, initiating file processing, and executing complex searches with ease.

## Main Goals 🎯

- **Fast & Efficient Search**: Our search engine is optimized for speed and efficiency, providing a user experience comparable to other leading search engines.
- **Comprehensive Indexing**: We extract and index all text within documents, including their content.
- **Scalability**: The architecture is designed to scale effortlessly, leveraging modern data movement technologies.
- **Diverse File Handling**: It's capable of handling a large number of files in various formats, including substantial ones.
- **High Availability**: We've optimized the system to store vast amounts of data, maintaining multiple copies to ensure high availability and fault tolerance.
- **Integration Capabilities**: The project is flexible, allowing seamless integration with external systems for complex tasks and platform usage scenarios.

## Architecture Overview 🏛️

<img width="auto" src="./images/document_search_engine_architecture.png" />

Several critical components underpin our project, including:

- 📂 **HDFS Cluster**: We use a 3-datanode HDFS cluster to store original files for processing.
- 🌟 **Apache Tika**: We utilize two versions of Apache Tika servers, one of which has OCR capabilities for content extraction from images and scanned PDFs.
- 📤 **SFTP Server**: This serves as the entry point for the NiFi ETL process. A microservice uploads files to a shared directory, while a NiFi processor continuously polls for new additions.
- 🔄 **ETL Process**: The NiFi ETL process moves files to the HDFS directory, determines their MIME type, and makes HTTP requests to the appropriate Apache Tika server for metadata and text content extraction. The data is then stored in a MongoDB collection, with process state updates published to Kafka.
- 🐘 **Elasticsearch Integration**: Complex searches are made possible by syncing data to Elasticsearch via a Logstash pipeline, as MongoDB lacks advanced search capabilities.
- 📊 **Data Exploration Tools**: MongoDB Express and Kibana are employed to explore and visualize indexed data.
- 🌐 **Microservice Coordination**: A Consul agent continuously monitors service availability and network locations.
- 🔐 **Authentication & Authorization**: All exposed services require authentication and authorization, facilitated by obtaining identity from the SSO Keycloak Server through the API Gateway Service.
- 🌉 **API Gateway**: The API Gateway microservice unifies all APIs into a single point of entry using Spring Cloud Gateway.

## Used technology

* Spring Boot 2.3.5 / Apache Maven 3.6.3.
* Spring Boot Starter Actuator.
* Spring Cloud Stream.
* Spring Cloud Gateway.
* Spring Cloud Starter Consul Discovery.
* Spring Cloud Starter OpenFeign.
* Springdoc OpenApi.
* Spring Boot Starter Security.
* Spring Security OAuth2.
* ElasticSearch - Logstash - Kibana (ELK Stack).
* MongoDB.
* Mongo DB Express (Web-based MongoDB admin interface, written with Node.js and express).
* Consul Server.
* SSO Keycloak Server.
* Hadoop HDFS.
* Apache Nifi.
* Apache Tika Server.
* Rabbit MQ / STOMP protocol.
* Apache Kafka.
* Kafka Rest Proxy

## Running Applications as Docker containers.

### Rake Tasks

The available tasks are detailed below (rake --task)


| Task | Description |
| ------ | ------ |
| check_deployment_file_task | Check Deployment File |
| check_docker_task | Check Docker and Docker Compose Task |
| cleaning_environment_task | Cleaning Evironment Task |
| deploy | Deploys the Document Search Engine architecture and laun... |
| login | Authenticating with existing credentials |
| start | Start Containers |
| status | Status Containers |
| stop | Stop Containers |
| undeploy | UnDeploy Document Search Engine architecture |


To start the platform make sure you have Ruby installed, go to the root directory of the project and run the `rake deploy` task, this task will carry out a series of preliminary checks, discard images and volumes that are no longer necessary and also proceed to download all the images and the initialization of the containers.


### Containers Ports

In this table you can view the ports assigned to each service to access to the Web tools or something else you can use to monitoring the flow.

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

## Some Videos

[![An architectural approach to implement a large-scale document search engine based on Apache Nifi](https://img.youtube.com/vi/-wJElnR3St4/maxresdefault.jpg)](https://youtu.be/-wJElnR3St4)

[![An architectural approach to implement a large-scale document search engine based on Apache Nifi](https://img.youtube.com/vi/9aQTO5J7_K4/maxresdefault.jpg)](https://youtu.be/9aQTO5J7_K4)

[![Microservice architecture to interact with the platform](https://img.youtube.com/vi/FZzMTr_z0Lw/hqdefault.jpg)](https://youtu.be/FZzMTr_z0Lw)



## Some screenshots

As follow, I include some images that help us to understand the performance of each part of system

### ETL Flow based on Apache Nifi

Apache NiFi supports powerful and scalable directed graphs of data routing, transformation, and system mediation logic.

<img width="auto" src="./images/apache_nifi_1.PNG" />
<img width="auto" src="./images/apache_nifi_2.PNG" />
<img width="auto" src="./images/apache_nifi_3.PNG" />
<img width="auto" src="./images/apache_nifi_4.PNG" />
<img width="auto" src="./images/apache_nifi_5.PNG" />
<img width="auto" src="./images/apache_nifi_6.PNG" />
<img width="auto" src="./images/apache_nifi_7.PNG" />

### Events System based on Apache Kafka

Apache Kafka is an open-source distributed event streaming platform used by thousands of companies for high-performance data pipelines, streaming analytics, data integration, and mission-critical applications.

<img width="auto" src="./images/apache_kafka_1.PNG" />
<img width="auto" src="./images/apache_kafka_2.PNG" />

### Apache Hadoop HDFS to store the files that will proccess

The Hadoop Distributed File System (HDFS) is a distributed file system designed to run on commodity hardware. It has many similarities with existing distributed file systems. However, the differences from other distributed file systems are significant. HDFS is highly fault-tolerant and is designed to be deployed on low-cost hardware. HDFS provides high throughput access to application data and is suitable for applications that have large data sets. HDFS relaxes a few POSIX requirements to enable streaming access to file system data. HDFS was originally built as infrastructure for the Apache Nutch web search engine project. HDFS is now an Apache Hadoop subproject.

<img width="auto" src="./images/hdfs_1.PNG" />
<img width="auto" src="./images/hdfs_2.PNG" />
<img width="auto" src="./images/hdfs_3.PNG" />

### MongoDB to store the metadata and content of the files that have been proccessed.

<img width="auto" src="./images/mongodb_1.PNG" />
<img width="auto" src="./images/mongodb_2.PNG" />
<img width="auto" src="./images/mongodb_3.PNG" />
<img width="auto" src="./images/mongodb_4.PNG" />
<img width="auto" src="./images/mongodb_5.PNG" />

### Consul to coordinate microservices architecture. 

<img width="auto" src="./images/consul_1.PNG" />
<img width="auto" src="./images/consul_2.PNG" />
<img width="auto" src="./images/consul_3.PNG" />

### SSO Keycloak Server

<img width="auto" src="./images/keycloak_1.PNG" />
<img width="auto" src="./images/keycloak_2.PNG" />
<img width="auto" src="./images/keycloak_3.PNG" />
<img width="auto" src="./images/keycloak_4.PNG" />
<img width="auto" src="./images/keycloak_5.PNG" />

### The entry point to the architecture.

<img width="auto" src="./images/gateway_1.PNG" />
<img width="auto" src="./images/gateway_2.PNG" />
<img width="auto" src="./images/gateway_3.PNG" />
<img width="auto" src="./images/gateway_4.PNG" />
<img width="auto" src="./images/gateway_5.PNG" />
<img width="auto" src="./images/gateway_6.PNG" />
<img width="auto" src="./images/gateway_7.PNG" />
<img width="auto" src="./images/gateway_8.PNG" />

### ELK Stack

<img width="auto" src="./images/kibana_1.PNG" />
<img width="auto" src="./images/kibana_2.PNG" />
<img width="auto" src="./images/kibana_3.PNG" />
<img width="auto" src="./images/kibana_4.PNG" />
<img width="auto" src="./images/kibana_5.PNG" />
<img width="auto" src="./images/kibana_6.PNG" />
<img width="auto" src="./images/kibana_7.PNG" />

## Visitors Count

<img width="auto" src="https://profile-counter.glitch.me/document_search_engine_architecture/count.svg" />

## Please Share & Star the repository to keep me motivated.
  <a href = "https://github.com/sergio11/document_search_engine_architecture/stargazers">
     <img src = "https://img.shields.io/github/stars/sergio11/document_search_engine_architecture" />
  </a>
  <a href = "https://twitter.com/SergioReact418">
     <img src = "https://img.shields.io/twitter/url?label=follow&style=social&url=https%3A%2F%2Ftwitter.com%2FSergioReact418" />
  </a>

