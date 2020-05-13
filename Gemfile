source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Build user policies
gem "pundit"

gem 'haml'
# gem 'bootstrap', '~> 4.4.1'
gem 'font-awesome-sass', '~> 5.12.0'
# gem 'jquery-rails'

gem 'devise'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'

# Active Record Adapter
gem 'pg'

gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'uglifier', '>= 1.3.0'

gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'bootstrap4-kaminari-views'
gem 'kaminari'
gem 'kaminari-i18n'

gem 'ransack', github: 'activerecord-hackery/ransack'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'simple_form'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'rspec_junit_formatter'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'solargraph'
  gem 'yaml_db'
end

group :test do
  gem 'simplecov'
  gem 'simplecov-rcov'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails-erd'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
