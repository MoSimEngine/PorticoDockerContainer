# Base image to use
FROM openjdk:slim

WORKDIR /portico

ADD . /portico

RUN CLASSPATH=portico/lib/portico.jar

CMD cd examples/java/hla13/; ./linux.sh compile; ./linux.sh execute

#CMD javac -cp /portico/lib/portico.jar /portico/examples/java/hla13/src/hla13/*.java; jar -cf /portico/examples/java/hla13/java-hla13.jar /portico/examples/java/hla13/src/hla13/*.class; java -cp /portico/lib/portico.jar /portico/examples/java/hla13/java-hla13.Example13Federate; tail -f /dev/null;
