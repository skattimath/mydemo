FROM centos

MAINTAINER skattimath@gmail.com

RUN yum -y update && \
    yum -y install wget && \
    yum install -y tar.x86_64 && \
    yum clean all

RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat

RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.73/bin/apache-tomcat-8.5.73.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.73/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

COPY .keystore /opt/tomcat/conf/.
COPY server.xml /opt/tomcat/conf/.
COPY tomcat-users.xml /opt/tomcat/conf/.

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://tomcat.apache.org/tomcat-8.5-doc/appdev/sample/sample.war

EXPOSE 8080 8443

VOLUME ["/opt/tomcat/logs"]

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
