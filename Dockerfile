FROM ubuntu:22.04

ARG username
ARG userid
ARG home_dir

ENV ANSIBLE_VERSION 2.16.4

USER root

RUN apt-get -y update; \
    apt-get install -y gcc python3; \
    apt-get install -y python3-pip; \
    apt-get install -y openssh-client; \
    apt-get install -y wget; \
    apt-get clean all

RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible

RUN mkdir -p /dockerweb

COPY ansible /dockerweb/ansible
COPY golandWeb /dockerweb/golandWeb
COPY variables.sh /dockerweb/

RUN chmod +x /dockerweb/ansible/run-playbook.sh
# RUN ./dockerweb/ansible/run-playbook.sh

EXPOSE 8080

# CMD ["go run /dockerweb/golandWeb/cmd/web/main.go"]

ENTRYPOINT [ "/dockerweb/ansible/run-playbook.sh" ]
# CMD [ "/dockerweb/ansible/run-playbook.sh" ] ["tail -f /dev/null"]

