FROM registry.access.redhat.com/openshift3/ose-docker-builder:latest
MAINTAINER Daniel Tschan <tschan@puzzle.ch>

RUN rpm -ihv https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
  yum -y --disablerepo=* --enablerepo=rhel-7-server-rpms --enablerepo=rhel-7-server-extras-rpms --enablerepo=rhel-7-server-optional-rpms --enablerepo=epel install docker-1.8.2 jq unzip && \
  yum clean all

ADD ./build.sh /tmp/build.sh

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/tmp/build.sh"]
