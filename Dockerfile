# temp container to build using gradle
FROM gradle:7.6.4 AS TEMP_BUILD_IMAGE
RUN echo "--------------------------------"
RUN echo "------BUILD IMAGE DEI---------"
RUN echo "--------------------------------"
RUN mkdir -p /app/
WORKDIR /app/
COPY . /app/
USER root
RUN chown -R gradle .
# RUN gradle runDev
RUN gradle :back-prueba:build

# actual container
FROM openjdk:17
RUN mkdir -p /app/config
RUN ls -la
COPY --from=TEMP_BUILD_IMAGE /app/back-prueba/build/libs/*.jar /app/
EXPOSE 8080
ENTRYPOINT ["java", "-jar","/app/build/libs/back-prueba-0.0.1-SNAPSHOT.jar"]
