gem 'puma', '3.2.0'
# gem 'sidekiq'
# gem 'rspec'
# gem 'factoryGirl'
gem 'devise', '3.5.6'
# gem 'capistrano'
gem 'foreman', '0.78.0'
gem 'bootstrap-sass', '3.3.6'
gem 'will_paginate', '3.1.0'
gem 'gretel', '3.0.8'

gem_group :development, :test do
  gem 'quiet_assets', '1.1.0'
end

application  do
  %q{
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
  }
end
