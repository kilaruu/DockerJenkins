FROM ubuntu as stage1
RUN apt update
RUN apt install default-jdk maven git -y
RUN git clone https://github.com/ChetanaMJyothi/webAppChetana.git

FROM maven as stage2
COPY --from=stage1 /webAppChetana .
RUN mvn clean install

FROM adhig93/tomcat-conf as stage3
COPY --from=stage2 /target/*.war /usr/local/tomcat/webapps/
