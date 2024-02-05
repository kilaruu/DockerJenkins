FROM ubuntu as stage1
RUN apt update
RUN apt install default-jdk maven -y
COPY . .
RUN mvn clean install

FROM adhig93/tomcat-conf
COPY --from=stage1 /target/*.war /usr/local/tomcat/webapps/
