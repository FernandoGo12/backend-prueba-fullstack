FROM openjdk:17

COPY /build/libs/back-prueba-0.0.1-SNAPSHOT.jar /myapp.jar

ENTRYPOINT ["java", "-jar", "myapp,jar"]
