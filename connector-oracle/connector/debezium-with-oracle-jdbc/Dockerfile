ARG DEBEZIUM_VERSION
FROM debezium/connect:1.4
ENV KAFKA_CONNECT_JDBC_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-jdbc
ENV INSTANT_CLIENT_DIR=/instant_client/

USER root
RUN yum -y install libaio && yum clean all && rm /kafka/connect/debezium-connector-oracle/*

USER kafka
# Deploy Oracle client and drivers

COPY oracle_instantclient/* $INSTANT_CLIENT_DIR
COPY oracle_instantclient/xstreams.jar /kafka/libs
COPY oracle_instantclient/ojdbc8.jar /kafka/libs
COPY debezium-connector-oracle-1.0.68.jar /kafka/connect/debezium-connector-oracle/
