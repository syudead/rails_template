# rails_template

# 使い方

```
rails _4.2.6_ new sample444 --skip-spring -d postgresql -T -m https://raw.githubusercontent.com/syudead/rails_template/master/app.rb
```

# 追加するgem

```
group :production do
  gem 'unicorn', '4.9.0'
  gem 'unicorn-worker-killer', '0.4.3'
end

group :development, :test do
  gem 'rspec-rails', '3.4.0'
  gem 'factory_girl', '4.5.0'
  gem 'factory_girl_rails', '4.6.0'
  gem 'faker', '1.6.3'
  gem 'rspec_junit_formatter', '0.2.2'
end

group :development do
  gem 'puma', '3.2.0'
  gem 'foreman', '0.78.0'
  gem 'rails_db', '1.1.1'
  gem 'binding_of_caller', '0.7.2'
  gem 'better_errors', '2.1.1'
  gem 'quiet_assets', '1.1.0'
  gem 'capistrano', '~> 3.3.5'
  gem 'capistrano-bundler', '1.1.4'
  gem 'capistrano-rails', '~> 1.1.1'
  gem 'capistrano3-unicorn', '0.2.1'
  gem 'capistrano-sidekiq', '0.5.2'
end

gem 'seed-fu', '2.3.5'
gem 'dotenv-rails', '2.1.0'
gem 'devise', '3.5.6'
gem 'will_paginate', '3.1.0'
gem 'haml', '4.0.7'
gem 'haml-rails', '0.9.0'
gem 'gretel', '3.0.8'
gem 'simple_form', '3.2.1'
gem 'wicked', '1.2.1'
gem 'bootstrap-sass', '3.3.6'
gem 'will_paginate-bootstrap', '1.0.1'
gem 'sidekiq', '4.1.1'
```

# 実行する処理

* 日本語環境のセットアップ
* hamlのセットアップ
* rspecのセットアップ
