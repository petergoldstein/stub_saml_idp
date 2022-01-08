# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../support/rails_app'
require 'rails'

require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--allow-insecure-localhost')
  options.add_argument('--ignore-certificate-errors')

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    capabilities: [options]
  )
end
Capybara.default_driver = :chrome
Capybara.server = :webrick
