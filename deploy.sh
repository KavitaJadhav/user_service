#!/bin/bash

echo "Deployment started"
whoami

invoke: 'rvm:use', 'ruby-2.4.1@default'

bundle install
RAILS_ENV=test bundle exec rake db:drop
RAILS_ENV=test bundle exec rake db:create
RAILS_ENV=test bundle exec rake db:migrate
RAILS_ENV=test bundle exec rake db:seed
