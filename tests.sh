#/bin/sh
$(which gem) install bundler
bundle install
rspec
