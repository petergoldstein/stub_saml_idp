# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :development, :test do
  gem 'nokogiri'
  gem 'rails', '>= 6.1.0'
  gem 'rake'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'ruby-saml'
end

group :test do
  gem 'capybara'
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
