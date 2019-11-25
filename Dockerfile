FROM  ubuntu:18.04

RUN apt-get update && \
    apt-get install -y openssh-server nano htop curl && \
    mkdir /var/run/sshd && \
    mkdir /root/.ssh 

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22
COPY start.sh .
RUN chmod +x start.sh

CMD ["/start.sh"]