FROM ubuntu:22.04

ARG username
ARG userid
ARG home_dir

ENV ANSIBLE_VERSION 2.16.4

USER root

RUN apt-get -y update; \
    apt-get install -y gcc python3; \
    apt-get install -y python3-pip; \
    apt-get clean all

RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible

