port=${1:-9292}
bundle exec rackup -p $port config.ru
