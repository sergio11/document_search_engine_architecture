FROM apache/nifi:1.12.0
COPY ./conf/core-site.xml /opt/nifi/conf/
COPY ./conf/hdfs-site.xml /opt/nifi/conf/
COPY ./templates/Ingest_Files_Pipeline_Template_v9.xml /opt/nifi/nifi-current/conf/templates
COPY --chown=nifi:nifi flow.xml.gz /opt/nifi/nifi-current/conf/
EXPOSE 8080
