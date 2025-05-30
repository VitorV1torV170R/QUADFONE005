#!/usr/bin/env bash

# Exit on error
set -o errexit

bundle install
# bin/rails assets:precompile
bundle exec rails assets:precompile

# bin/rails assets:clean
bundle exec rails assets:clean

# If you have a paid instance type, we recommend moving
# database migrations like this one from the build command
# to the pre-deploy command:
# bin/rails db:migrate
bundle exec rails db:migrate

# bin/rails db:seed
bundle exec rails db:seed
