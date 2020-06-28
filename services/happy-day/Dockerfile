FROM node:14-buster

# Install packages
RUN \
	apt-get update && \
	apt-get install --yes \
		wget

# Install SOPS package from source
ENV SOPS_VERSION=3.5.0
RUN wget -O /tmp/sops.deb https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops_${SOPS_VERSION}_amd64.deb
RUN apt install /tmp/sops.deb
RUN rm -rf /tmp/sops.deb

WORKDIR /app

ENV NODE_ENV=production
COPY package.json package-lock.json ./
RUN npm install

COPY . .

ENV \
	AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
	AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

CMD [ "npm", "run", "start" ]
