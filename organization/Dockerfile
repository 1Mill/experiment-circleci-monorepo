FROM ubuntu:20.04

RUN apt-get update && apt-get install --yes unzip wget

ARG TERRAFORM_VERSION=0.12.28
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_386.zip
RUN unzip /tmp/terraform.zip -d /usr/local/bin/
RUN rm /tmp/terraform.zip

WORKDIR /app
COPY . .

CMD [ "bash", "entrypoint.bash" ]
