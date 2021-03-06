# Latest version of centos
FROM centos:centos7
MAINTAINER Asher Hsieh <fellow942111@gmail.com>
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip
RUN mkdir /etc/ansible/
RUN echo -e '[local]\nlocalhost' > /etc/ansible/hosts
RUN pip install ansible
RUN mkdir /etc/ansible/ess-ansible
WORKDIR /etc/ansible/ess-ansible
