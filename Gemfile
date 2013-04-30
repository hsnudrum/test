source 'https://rubygems.org'

gem 'rails', '3.2.3'


group :development do
  gem 'sqlite3'
  gem 'rspec-rails', '2.9.0'
  gem 'capybara', '1.1.2'
  gem 'debugger'
  gem 'rb-fsevent', :require => false  # line before guard on mac os x see https://github.com/guard/guard
  gem 'guard'
  gem 'guard-ctags-bundler'
end

group :production do
   gem 'pg', '0.12.2'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # gem 'bootstrap-sass', '~> 2.0.0'
  gem 'uglifier', '>= 1.0.3'
end

# gem 'twitter-bootstrap-rails'  # leave at top level -> https://github.com/seyhunak/twitter-bootstrap-rails/issues/123
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git' # get later version


gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
gem 'jquery-ui-rails'
gem 'jquery-rails'
gem 'devise'
gem "simple_form"
gem "httparty"
gem 'thin'
gem 'gibberish'
gem 'carrierwave'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'gibberish'
gem 'copycopter_client', '~> 2.0.1'
gem 'friendly_id'

gem 'activeadmin'
gem 'split', '0.3.3', :require => 'split/dashboard'
gem "mailchimp", "~> 0.0.7.alpha"
