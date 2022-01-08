# frozen_string_literal: true

warn("Running Specs under Ruby Version #{RUBY_VERSION}")

require 'rspec'
require 'capybara/rspec'

require 'ruby-saml'
require 'stub_saml_idp'
require 'support/saml_request_macros'

Capybara.default_host = 'https://app.example.com'

RSpec.configure do |config|
  config.mock_with :rspec
  config.include SamlRequestMacros
end
