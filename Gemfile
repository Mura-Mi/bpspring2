source 'https://rubygems.org'

gem 'rails', '4.2.4'

# Serializers
gem 'active_model_serializers', '~> 0.10.rc3'

# Active Model
gem 'audited-activerecord', '~> 4.0'

# Authentication
gem 'devise', '3.5.2'
gem 'omniauth-twitter', '1.2.1'

# CSS
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '3.3.5.1'

# JavaScript
gem 'uglifier', '>= 1.3.0'
gem 'typescript-rails', '0.6.2'
gem 'jquery-rails', '4.0.5'
gem 'jquery-ui-rails', '5.0.5'

gem 'nested_form_fields'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'

gem 'bcrypt', '3.1.10'

gem 'seed-fu', '~> 2.3'

# Images
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick', '4.3.6'
gem 'fog-aws'

gem 'coveralls', '0.8.3', require: false

group :development, :test do
  gem 'sqlite3', '1.3.11'
  gem 'rake', '10.4.2'

  gem 'rspec-rails', '3.3.3'
  gem 'factory_girl_rails', '4.5.0'
  gem 'rspec-collection_matchers', '1.1.2'
  gem 'spring-commands-rspec', '1.0.4'
  gem 'json_spec', '1.1.4'

  gem 'pry-rails', '0.3.4'
  gem 'pry-byebug', '3.2.0'
  gem 'hirb-unicode', '0.0.5'
  gem 'better_errors', '2.1.1'
  gem 'binding_of_caller', '0.7.2'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '2.2.1'
  gem 'spring', '1.4.0'

  gem 'guard', '2.13.0', require: false
  gem 'guard-rspec', '4.6.4', require: false
  gem 'guard-livereload', '2.4.0', require: false
  gem 'rack-livereload', '0.3.16'

  gem 'travis', '~> 1.6.0', require: false

end

group :test do
  gem 'codeclimate-test-reporter', require: false
end

group :production do
  gem 'pg', '0.18.3', require: false
end
