FROM ruby:2.7.4

RUN mkdir /code
WORKDIR /code
RUN wget https://github.com/FiloSottile/age/releases/download/v1.0.0-rc.3/age-v1.0.0-rc.3-linux-amd64.tar.gz
RUN tar -xf age-v1.0.0-rc.3-linux-amd64.tar.gz 
RUN mv age/age* /usr/bin
ADD Gemfile /code/Gemfile
RUN bundle install
RUN rm -rf /code/age*
