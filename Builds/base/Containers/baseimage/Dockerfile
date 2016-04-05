FROM  nfnty/arch-mini
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm jdk8-openjdk go git gcc make automake jq gradle maven 
ADD supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord","-n"]

