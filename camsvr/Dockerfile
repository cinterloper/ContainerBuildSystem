FROM example/baseimage
RUN dnf install -y http://download1.rpmfusion.org/free/fedora/development/22/x86_64/os/rpmfusion-free-release-22-1.noarch.rpm
RUN dnf -y groupinstall "development tools"  
RUN dnf -y install lz4 lzo lz4-devel lzo-devel libjpeg-turbo-devel libjpeg-turbo ffmpeg-devel ffmpeg
RUN git clone https://github.com/hyperbolic2346/motion.git 
RUN cd motion; ./configure; make -j3; make install
ADD supervisord.conf /etc/supervisord.conf
