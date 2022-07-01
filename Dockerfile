FROM ruby:3.0.0

RUN mkdir /rails
WORKDIR /rails
COPY rails/Gemfile Gemfile
COPY rails/Gemfile.lock Gemfile.lock

RUN bundle config set force_ruby_platform true
RUN gem install nokogiri --platform=ruby
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

