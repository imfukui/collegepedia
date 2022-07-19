FROM ruby:3.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN mkdir /collegepedia
WORKDIR /collegepedia
COPY Gemfile /collegepedia/Gemfile
COPY Gemfile.lock /collegepedia/Gemfile.lock
RUN bundle install
COPY . /collegepedia

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
