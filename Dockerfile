FROM ushuaia/ibmjava

ENV KAFKAMGR_VERSION 1.3.3.23

RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo \
 && yum install sbt \
 && curl -s -O https://github.com/ncwuping/kafka-manager/blob/master/kafka-manager-${KAFKAMGR_VERSION}.tar.gz \
 && tar zxf kafka-manager-${KAFKAMGR_VERSION}.tar.gz --directory /usr/src \
 && rm -f kafka-manager-${KAFKAMGR_VERSION}.tar.gz \
 && PATH=/opt/ibm/java/bin:\$PATH \
 && JAVA_HOME=/opt/ibm/java \
 && /usr/src/kafka-manager-${KAFKAMGR_VERSION}/sbt -java-home /opt/ibm/java clean dist \
 && rm -rf /usr/src/kafka-manager-${KAFKAMGR_VERSION}
