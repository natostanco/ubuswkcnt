FROM ubuntu:16.04

# Env
ENV PHANTOMJS_VERSION 2.1.1

# Commands
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y vim git wget fontconfig freetype* bzip2 ca-certificates && \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /opt/phantomjs && \
  ln -s /opt/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
  git clone https://github.com/casperjs/casperjs.git /opt/casperjs && \
  ln -s /opt/casperjs/bin/casperjs /usr/bin/casperjs && \
  apt-get autoremove -y && \
  apt-get clean all

# Default command
CMD ["/usr/bin/phantomjs"]
