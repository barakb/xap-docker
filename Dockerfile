
#
#
#  XAP Dockerfile
#
#


FROM java:8
MAINTAINER Kobi Kisos

ENV XAP_HOME /opt/xap/
ENV XAP_VERSION 12.0.0
ENV XAP_BUILD_NUMBER 15792-124
ENV XAP_MILESTONE m2

RUN mkdir -p $XAP_HOME
WORKDIR $XAP_HOME

# Download XAP
ADD https://gigaspaces-repository-eu.s3.amazonaws.com/com/gigaspaces/xap-open/${XAP_VERSION}-${XAP_BUILD_NUMBER}-${XAP_MILESTONE}/gigaspaces-xap-open-${XAP_VERSION}-${XAP_MILESTONE}-b${XAP_BUILD_NUMBER}.zip ${XAP_HOME}/gigaspaces-xap-open-${XAP_VERSION}-${XAP_MILESTONE}-b${XAP_BUILD_NUMBER}.zip
RUN unzip gigaspaces-xap-open-${XAP_VERSION}-${XAP_MILESTONE}-b${XAP_BUILD_NUMBER}.zip

ENV XAP_NIC_ADDRESS "#local:ip#"
ENV EXT_JAVA_OPTIONS "-Dcom.gs.transport_protocol.lrmi.bind-port=10000-10100 -Dcom.gigaspaces.start.httpPort=9104 -Dcom.gigaspaces.system.registryPort=7102"
ENV XAP_LOOKUP_GROUPS xap

EXPOSE 10000-10100
EXPOSE 9104
EXPOSE 7102
EXPOSE 4174


ENTRYPOINT ["./bin/space-instance.sh"]
CMD ["./bin/space-instance.sh, ""]