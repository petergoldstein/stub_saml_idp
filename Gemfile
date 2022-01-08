# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :development, :test do
  gem 'rails', '~> 7.0.0'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'ruby-saml'
end

group :test do
  gem 'capybara'
  gem 'rake'
  gem 'rspec', '~> 3.0'
  gem 'rspec-rails', '~> 5.0'
  gem 'selenium-webdriver'
  gem 'timecop'
end

if Gem::Version.new(RUBY_VERSION.dup) >= Gem::Version.new('3.1')
  gem 'net-imap', require: false
  gem 'net-pop', require: false
  gem 'net-smtp', require: false
end
