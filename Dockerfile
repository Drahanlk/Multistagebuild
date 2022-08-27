FROM maven:amazoncorretto AS stage1
WORKDIR /javaapp
RUN git clone https://github.com/adhig93/java-mbuild
RUN cd java-mbuild && mvn clean package

FROM openjdk:9
COPY --from=stage1 /javaapp/target/gs-maven-0.1.0.jar /usr/app/gs-maven-0.1.0.jar
ENTRYPOINT ["java","-jar","/usr/app/gs-maven-0.1.0.jar"]
