# frozen_string_literal: true

module StubSamlIdp
  class IdpController < ActionController::Base
    include StubSamlIdp::Controller

    protect_from_forgery

    before_action :validate_saml_request

    def new
      render template: 'stub_saml_idp/idp/new'
    end

    def create
      render_no_params && return unless auth_params?

      if person.nil?
        render_auth_failure
      else
        @saml_response = idp_make_saml_response(person)
        render template: 'stub_saml_idp/idp/saml_post', layout: false
      end
    end

    def render_no_params
      render template: 'stub_saml_idp/idp/new'
    end

    def render_auth_failure
      @saml_idp_fail_msg = 'Incorrect email or password.'
      render template: 'stub_saml_idp/idp/new'
    end

    def person
      return nil unless auth_params?

      @person ||= idp_authenticate(params[:email], params[:password])
    end

    def auth_params?
      !(params[:email].blank? || params[:password].blank?)
    end

    protected

    def idp_authenticate(_email, _password)
      raise 'Not implemented'
    end

    def idp_make_saml_response(_person)
      raise 'Not implemented'
    end
  end
end
