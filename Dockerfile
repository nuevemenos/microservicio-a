FROM ucalgary/glassfish 

ENV PATH /usr/local/glassfish3/glassfish/bin:$PATH

EXPOSE 4848 8080 8181

RUN mkdir -p /scripts
COPY create_cluster_instance.sh /scripts
WORKDIR /scripts
RUN chmod +x create_cluster_instance.sh
RUN ./create_cluster_instance.sh

#COPY domains1 /usr/lib/jvm/java-1.7-openjdk/jre/lib/ext
#COPY domains2 /usr/local/glassfish3/glassfish/domains/domain1/lib/ext
#COPY domains3 /usr/local/glassfish3/glassfish/domains/domain1/config/dgsisan-config/lib/ext
#COPY domains4 /usr/local/glassfish3/mq/lib/ext


RUN wget -O /usr/local/glassfish3/glassfish/domains/domain1/autodeploy/helloworld.war \
    https://github.com/javaee/glassfish/blob/371c9e1beb285a30bd4203ec86fde5729dbd06f9/appserver/tests/appserv-tests/devtests/cluster/apps/helloworld.war?raw=true

#ADD https://github.com/javaee/glassfish/blob/371c9e1beb285a30bd4203ec86fde5729dbd06f9/appserver/tests/appserv-tests/devtests/cluster/apps/helloworld.war?raw=true /usr/local/glassfish3/glassfish/domains/domain1/autodeploy/helloworld.war
