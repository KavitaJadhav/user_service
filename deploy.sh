#!/bin/bash

echo "Deployment started"

bundle exec rake RAILS_ENV=test db:drop
bundle exec rake RAILS_ENV=test db:create
bundle exec rake RAILS_ENV=test db:migrate
bundle exec rake RAILS_ENV=test db:seed
