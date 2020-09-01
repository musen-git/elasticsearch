FROM hub.intra.mlamp.cn/merp/centos7-java:1.8.0_112
WORKDIR /opt/app
COPY elasticsearch-7.2.1 /opt/app/elasticsearch-7.2.1
#COPY jdk1.8.0_181 /usr/local/jdk1.8.0_181
#RUN rm -rf /usr/local/jdk1.8.0_112 && rm -rf /usr/local/jdk && ln -s /usr/local/jdk1.8.0_181 /usr/local/jdk 
#RUN rm -rf  /usr/local/jdk1.8.0_181/jre/lib/security/US_export_policy.jar
#RUN rm -rf /usr/local/jdk1.8.0_181/jre/lib/security/local_policy.jar
#COPY US_export_policy.jar /usr/local/jdk1.8.0_181/jre/lib/security/US_export_policy.jar
#COPY local_policy.jar /usr/local/jdk1.8.0_181/jre/lib/security/local_policy.jar
RUN yum install net-tools sudo  -y
RUN echo "vm.max_map_count=262144" >> /etc/sysctl.conf
RUN echo "es  ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "#Defaults requiretty" >> /etc/sudoers
#RUN sudo /sbin/sysctl -w vm.max_map_count=262144 && /sbin/sysctl -p
RUN useradd es
RUN chown es.es -R /opt/app/elasticsearch-7.2.1
USER es
#CMD ["/opt/app/elasticsearch-7.2.1/bin/elasticsearch"]
EXPOSE 9200
EXPOSE 9300
ENV TZ=Asia/Shanghai

