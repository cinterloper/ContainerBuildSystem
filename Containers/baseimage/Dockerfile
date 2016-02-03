FROM centos:latest
ADD resolv.conf /etc/resolv.conf
RUN yum -y update
RUN yum -y install epel-release  git screen lsof openssh-server nano telnet sudo zsh
RUN yum -y install supervisor
RUN useradd -m -G wheel user
RUN mkdir -p /home/user/.ssh
RUN chown user:user /home/user/.ssh
RUN chmod 700 /home/user/.ssh
ADD sudoers /etc/sudoers
RUN yum -y install curl unzip 
ENV HOME /root
RUN yum -y install perl-JSON perl jq curl hostname
WORKDIR /opt
ENV PWD /opt
ADD supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord","-n"]

