FROM apache/nifi:latest
COPY ./templates/Ingest_Files_Pipeline_Template_v5.xml /opt/nifi/nifi-current/conf/templates
COPY --chown=nifi:nifi flow.xml.gz /opt/nifi/nifi-current/conf/
EXPOSE 8080
