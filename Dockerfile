FROM adoptopenjdk:11-jre-hotspot
ARG BUILD_NUMBER
ENV MEMORY=1G
ENV REMOTE_ADDRESS=127.0.0.1
ENV REMOTE_AUTH_TYPE=online
VOLUME [ "/geyser/config" ]
RUN mkdir -p /geyser/config/
ADD https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/$BUILD_NUMBER/artifact/bootstrap/standalone/target/Geyser.jar /geyser/lib/
CMD [ "sh", "-c", "java -Xmx${MEMORY} -jar /geyser/lib/Geyser.jar --nogui --config /geyser/config/config.yml --remote.address=${REMOTE_ADDRESS} --remote.auth-type=${REMOTE_AUTH_TYPE}" ]