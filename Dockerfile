FROM ubuntu:14.04
MAINTAINER sorah

ADD git.list /etc/apt/sources.list.d/git.list
ADD E1DF1F24.pub /root/E1DF1F24.pub
RUN apt-key add /root/E1DF1F24.pub

RUN apt-get update && apt-get build-dep -y ruby2.0 && apt-get install -y ruby2.0 git-core automake autoconf
RUN mkdir -p /usr/local/bin

ADD setup-rbenv /usr/local/bin/setup-rbenv
RUN /usr/local/bin/setup-rbenv

ADD build /usr/local/bin/build

ENTRYPOINT ["build"]
