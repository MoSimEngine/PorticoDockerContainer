# Base image to use
FROM openjdk:slim
# Working directory
WORKDIR /portico

ADD . /portico
# First time run command
RUN CLASSPATH=portico/lib/portico.jar && \
    apt-get update && \
    apt-get install -y wget && \
    mkdir -p /usr/src/portico/ && \
    wget -qO- https://sourceforge.net/projects/portico/files/Portico/portico-2.1.0/portico-2.1.0-linux64.tar.gz/download \
    | tar -zxC /usr/src/portico && \
    mv /usr/src/portico/portico-2.1.0/* /portico/

# Standard execution when starting container
CMD cd examples/java/hla13/; ./linux.sh compile; ./linux.sh execute

#CMD javac -cp /portico/lib/portico.jar /portico/examples/java/hla13/src/hla13/*.java; jar -cf /portico/examples/java/hla13/java-hla13.jar /portico/examples/java/hla13/src/hla13/*.class; java -cp /portico/lib/portico.jar /portico/examples/java/hla13/java-hla13.Example13Federate; tail -f /dev/null;
