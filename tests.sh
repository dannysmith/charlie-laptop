#/bin/sh
$(which gem) install bundler
bundle install
bundle exec rspec
