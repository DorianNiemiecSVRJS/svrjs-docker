FROM devuan/devuan:stable
RUN apt update
RUN apt install -y curl
RUN curl -fsSL https://downloads.svrjs.org/installer/svr.js.installer.linux.20240506.sh > /tmp/installer.sh
RUN echo "#!/bin/bash" > /tmp/confirm.sh; echo "echo 0" >> /tmp/confirm.sh; echo "yes" >> /tmp/confirm.sh
RUN chmod +x /tmp/confirm.sh
RUN /tmp/confirm.sh | bash /tmp/installer.sh
RUN rm /tmp/*
RUN apt clean
EXPOSE 80
CMD ["svrjs"]
