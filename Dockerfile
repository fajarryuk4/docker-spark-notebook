FROM jupyter/all-spark-notebook:lab-3.2.8

COPY require ./

USER root

ENV GRANT_SUDO=yes

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive DEBCONF_NOWARNINGS=yes apt-get install -y \
	libmagic-dev pkg-config fuse libfuse3-3 python-llfuse-doc libfuse-dev

USER 1000

RUN pip install --quiet --no-cache-dir -r requirement.txt && rm -rf requirement.txt
