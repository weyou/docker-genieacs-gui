FROM ruby
MAINTAINER Kelvin You <weyou.dev@gmail.com>

WORKDIR /app

RUN git clone https://github.com/zaidka/genieacs-gui.git /app && \
    echo 'for f in /app/config/*-sample.yml; do mv "$f" "${f/-sample.yml/.yml}"; done' | bash - && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
	apt-get install -y nodejs && \
	RAILS_ENV=production bundle && \
    GENERATED_CODE=$(RAILS_ENV=production rake secret) && \
	RAILS_ENV=production SECRET_KEY_BASE=${GENERATED_CODE} bundle exec rake assets:precompile && \
    if [ -f /app/tmp/pids/server.pid ]; then rm /app/tmp/pids/server.pid; fi && \
    mv /app/config/graphs-sample.json.erb /app/config/graphs.json.erb

ADD ./production.rb /app/config/environments/production.rb

CMD ["rails", "s"]
