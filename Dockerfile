FROM ushuaia/ibmjava

ENV KAFKAMGR_VERSION 1.3.3.23

RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo \
 && yum -y install sbt which \
 && curl -L -O https://github.com/ncwuping/kafka-manager/raw/master/kafka-manager-${KAFKAMGR_VERSION}.tar.gz \
 && tar zxf kafka-manager-${KAFKAMGR_VERSION}.tar.gz --directory /usr/src \
 && rm -f kafka-manager-${KAFKAMGR_VERSION}.tar.gz \
 && cd /usr/src/kafka-manager-${KAFKAMGR_VERSION} \
 && JAVA_HOME=/opt/ibm/java \
 && ./sbt -java-home /opt/ibm/java clean dist \
 && cd - \
 && mv -f /usr/src/kafka-manager-${KAFKAMGR_VERSION}/target/universal/kafka-manager-${KAFKAMGR_VERSION}.zip ./ \
 && rm -rf /root/{.ivy2,.sbt} /usr/src/kafka-manager-${KAFKAMGR_VERSION}
