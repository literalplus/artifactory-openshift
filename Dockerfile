FROM "docker.bintray.io/jfrog/artifactory-oss:latest"

ARG ARTIFACTORY_HOME=/opt/jfrog/artifactory
ARG WEBAPPS=$ARTIFACTORY_HOME/webapps
ARG XMLS=$ARTIFACTORY_HOME/tomcat/conf/Catalina/localhost

RUN rm -rf $ARTIFACTORY_HOME/tomcat/webapps/*

RUN curl -Lo /opt/jfrog/artifactory/tomcat/lib/mysql-connector-java.jar https://jcenter.bintray.com/mysql/mysql-connector-java/5.1.41/mysql-connector-java-5.1.41.jar && \
  mv $WEBAPPS/artifactory.war $WEBAPPS/ROOT.war && \
  mv $XMLS/artifactory.xml $XMLS/ROOT.xml && \
  sed -i.bkp 's/path="\/artifactory"/path="\/"/' $XMLS/ROOT.xml && \
  sed -i.bkp 's/artifactory.war/ROOT.war/' $XMLS/ROOT.xml && \
  rm -rf $ARTIFACTORY_HOME/tomcat/work/Catalina

