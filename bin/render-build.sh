set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:rollback STEP=2
bundle exec rails db:migrate