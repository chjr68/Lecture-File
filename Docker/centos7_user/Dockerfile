# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER The finfraTeam Project <nowage@gmail.com>

ENV LC_ALL en_US.UTF-8


COPY ./start.sh /
RUN chmod 755 /start.sh

# ENTRYPOINT ["/xx/sshd","sshd"]
CMD /start.sh
