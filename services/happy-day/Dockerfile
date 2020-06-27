FROM node:14-buster

RUN apt-get update

WORKDIR /app

ENV NODE_ENV=production
COPY package.json package-lock.json ./
RUN npm install

COPY . .

ENV \
	AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
	AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

CMD [ "npm", "run", "start" ]
