FROM ruby:2.7.1
CMD [ "/bin/bash" ]

ARG apppath="/root/workspace"
WORKDIR $apppath

RUN cd $apppath
COPY workspace/Gemfile ./
RUN bundle install