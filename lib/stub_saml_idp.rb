# frozen_string_literal: true

module StubSamlIdp
  require 'stub_saml_idp/configurator'
  require 'stub_saml_idp/controller'
  require 'stub_saml_idp/default'
  require 'stub_saml_idp/version'
  require 'stub_saml_idp/engine' if defined?(::Rails) && Rails::VERSION::MAJOR > 2

  def self.config=(config)
    @config = config
  end

  def self.config
    @config ||= StubSamlIdp::Configurator.new
  end
end
