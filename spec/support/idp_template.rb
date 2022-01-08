# frozen_string_literal: true

# Set up a SAML IdP

gem 'stub_saml_idp', path: File.expand_path('../..', __dir__)

if Gem::Version.new(RUBY_VERSION.dup) >= Gem::Version.new('3.1')
  gem 'net-smtp', require: false
  gem 'net-imap', require: false
  gem 'net-pop', require: false
end

route "get '/saml/auth' => 'saml_idp#new'"
route "post '/saml/auth' => 'saml_idp#create'"

file 'app/controllers/saml_idp_controller.rb', <<-CODE
  # frozen_string_literal: true

  class SamlIdpController < StubSamlIdp::IdpController
    def idp_authenticate(email, _password)
      { email: email }
    end

    def idp_make_saml_response(user)
      encode_SAMLResponse(user[:email])
    end
  end
CODE
