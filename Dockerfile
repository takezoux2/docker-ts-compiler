

FROM ubuntu
MAINTAINER takezoux2 takezoux2@gmail.com

RUN apt-get -y update && apt-get install -y nodejs npm vim
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
RUN npm install -g gulp-cli
EXPOSE 80

WORKDIR /root/
COPY tool/* tool/
WORKDIR /root/typescript

CMD bash /root/tool/init.sh && gulp



