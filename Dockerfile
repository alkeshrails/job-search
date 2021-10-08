FROM ruby:2.7.2

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

ADD . /JobSearch
WORKDIR /JobSearch
RUN gem install bundler:2.2.15
RUN bundle install

EXPOSE 3000
CMD ["bash"]
