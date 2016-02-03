FROM cinterloper/webhook_responder
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm python2 python2-pip dialog jq docker openssh git grep procps-ng groff nodejs npm inetutils
ADD . /opt/DDE
RUN pip2 install awscli hvac envtpl
RUN npm -g install slack-cli
