FROM "docker.bintray.io/jfrog/artifactory-oss:latest"

RUN rm -rf $CATALINA_HOME/webapps/*

RUN curl -Lo /opt/jfrog/artifactory/tomcat/lib/mysql-connector-java.jar https://jcenter.bintray.com/mysql/mysql-connector-java/5.1.41/mysql-connector-java-5.1.41.jar
