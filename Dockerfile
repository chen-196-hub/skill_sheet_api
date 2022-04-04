FROM ruby:3.1

RUN mkdir /skill_sheet_api
WORKDIR /skill_sheet_api
COPY Gemfile /skill_sheet_api/Gemfile
COPY Gemfile.lock /skill_sheet_api/Gemfile.lock
RUN bundle install
COPY . /skill_sheet_api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
