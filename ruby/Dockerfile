FROM ruby:3.2
CMD [ "/bin/bash" ]

RUN sed -i -e "s/deb.debian.org/cloudfront.debian.net/g" /etc/apt/sources.list \
&&  apt-get update -y \
&&  apt-get install -y apt-transport-https \
&&  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&&  echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list \
&&  curl -sS https://deb.nodesource.com/setup_10.x | bash - \
&&  apt-get install -y yarn \
&&  apt-get purge -y apt-transport-https \
&&  apt-get autoremove \
&&  apt-get autoclean \
&&  apt-get clean

ARG apppath="/root/workspace"
WORKDIR $apppath

RUN cd $apppath
COPY workspace/Gemfile ./
RUN bundle install

COPY emptyfile_for_keeping_container_alive /root/emptyfile_for_keeping_container_alive
CMD ["sh", "-c", "tail -n 1 -f /root/emptyfile_for_keeping_container_alive"]