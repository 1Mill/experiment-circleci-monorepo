FROM node:14-buster

RUN \
	apt-get update && \
	apt-get install --yes \
		vim \
		wget

ENV SOPS_VERSION=3.5.0
RUN wget -O /tmp/sops.deb https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops_${SOPS_VERSION}_amd64.deb
RUN apt install /tmp/sops.deb
RUN rm -rf /tmp/sops.deb

WORKDIR /app

COPY . .

CMD [ "node", "index.js" ]
