FROM tonistiigi/dnsdock
RUN apt-get update
RUN apt-get install -y pdns-recursor 
CMD ["-docker=tcp://172.17.0.1:4243"]

