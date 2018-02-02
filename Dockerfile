FROM node:8-slim
MAINTAINER sunchanlee@inslab.co.kr

RUN npm install gitbook-cli -g

WORKDIR /srv/gitbook
ADD . /srv/gitbook/
RUN gitbook install

EXPOSE 4000 35729

CMD ["gitbook", "serve"]

