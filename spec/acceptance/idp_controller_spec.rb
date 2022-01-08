# frozen_string_literal: true

require_relative 'acceptance_helper'

describe 'IdpController', type: :feature do
  let(:idp_port) { 8009 }
  let(:sp_port) { 8022 }

  let(:idp_pid) do
    create_app('idp')
    start_app('idp', idp_port)
  end

  let(:sp_pid) do
    create_app('sp')
    start_app('sp', sp_port)
  end

  before do
    idp_pid
    sp_pid
  end

  after do
    stop_app('sp', sp_pid)
    stop_app('idp', idp_pid)
  end

  it 'Login via default signup page' do
    saml_request = make_saml_request("http://localhost:#{sp_port}/saml/consume")
    visit "http://localhost:#{idp_port}/saml/auth?SAMLRequest=#{CGI.escape(saml_request)}"
    fill_in 'Email', with: 'brad.copa@example.com'
    fill_in 'Password', with: 'okidoki'
    click_button 'Sign in'
    expect(current_url).to eq("http://localhost:#{sp_port}/saml/consume")
    expect(page).to have_content('brad.copa@example.com')
  end
end
