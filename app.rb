gem_group :production do
  gem 'unicorn', '4.9.0'
  gem 'unicorn-worker-killer', '0.4.3'
end

gem_group :development, :test do
  gem 'rspec-rails', '3.4.0'
  gem 'factory_girl', '4.5.0'
  gem 'factory_girl_rails', '4.6.0'
  gem 'faker', '1.6.3'
  gem 'rspec_junit_formatter', '0.2.2'
end

gem_group :development do
  gem 'puma', '3.2.0'
  gem 'foreman', '0.78.0'

  gem 'rails_db', '1.1.1'

  gem 'binding_of_caller', '0.7.2'
  gem 'better_errors', '2.1.1'

  gem 'quiet_assets', '1.1.0'

  # deploy
  gem 'capistrano', '~> 3.3.5'
  gem 'capistrano-bundler', '1.1.4'
  gem 'capistrano-rails', '~> 1.1.1'
  gem 'capistrano3-unicorn', '0.2.1'
  gem 'capistrano-sidekiq', '0.5.2'
end

### Global gems
# DB
gem 'seed-fu', '2.3.5'

# Config
gem 'dotenv-rails', '2.1.0'

# Auth
gem 'devise', '3.5.6'

# Models
# gem 'paranoia', '2.1.2'

## file upload support
# gem 'fog', '1.37.0'
# gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
# gem 'rmagick', '2.15.4'

# Views
gem 'will_paginate', '3.1.0'
gem 'haml', '4.0.7'
gem 'haml-rails', '0.9.0'
gem 'gretel', '3.0.8'
gem 'simple_form', '3.2.1'
gem 'wicked', '1.2.1'

# Views - bootstrap
gem 'bootstrap-sass', '3.3.6'
gem 'will_paginate-bootstrap', '1.0.1'

# Background
gem 'sidekiq', '4.1.1'

# Admin
gem 'activeadmin', '~> 1.0.0.pre2'

# I18n
gem 'devise-i18n', '1.0.0'
gem 'rails-i18n', '4.0.8'

### End of gems

# config/application.rb
application  do
  %q{
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework :rspec,
        fixture: true
    end
  }
end

# for activeadmin
initializer 'kaminari.rb', <<-CODE
# config/initializers/kaminari.rb
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end
CODE

after_bundle do
  generate "devise:install"
  generate "devise:views:i18n_templates"
  generate "rspec:install"
  generate "simple_form:install --bootstrap"
  generate "haml:application_layout"
  remove_file "app/views/layouts/application.html.erb"

  # i18n
  remove_file 'config/locales/en.yml'
  run 'curl https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml >> config/locales/ja.yml'
  run 'curl https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/en.yml >> config/locales/en.yml'

  # git
  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end

file 'Procfile', <<-CODE
web: bundle exec rails s -b 0.0.0.0
sidekiq: bundle exec sidekiq
CODE
