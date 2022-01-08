# frozen_string_literal: true

module SamlRequestMacros
  def make_saml_request(requested_saml_acs_url = 'https://foo.example.com/saml/consume')
    auth_request = ::OneLogin::RubySaml::Authrequest.new
    auth_url = auth_request.create(saml_settings(saml_acs_url: requested_saml_acs_url))
    CGI.unescape(auth_url.split('=').last)
  end

  def saml_settings(options = {})
    settings = ::OneLogin::RubySaml::Settings.new
    settings.assertion_consumer_service_url = options[:saml_acs_url] || 'https://foo.example.com/saml/consume'
    settings.issuer = options[:issuer] || 'https://foo.example.com/'
    settings.idp_sso_target_url = options[:idp_sso_target_url] || 'http://idp.com/saml/idp'
    settings.idp_cert_fingerprint = StubSamlIdp::Default::FINGERPRINT
    settings.name_identifier_format = StubSamlIdp::Default::NAME_ID_FORMAT
    settings
  end
end
