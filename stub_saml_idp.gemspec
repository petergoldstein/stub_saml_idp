# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'stub_saml_idp/version'

Gem::Specification.new do |s|
  s.name = 'stub_saml_idp'
  s.version = StubSamlIdp::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Peter M. Goldstein']
  s.email = 'peter.m.goldstein@gmail.com'
  s.homepage = 'http://github.com/petergoldstein/stub_saml_idp'
  s.summary = 'Stub SAML Identity Provider'
  s.description = 'Stub SAML IdP (Identity Provider) library'
  s.license = 'MIT'

  s.required_ruby_version = '>= 2.5'
  s.metadata['rubygems_mfa_required'] = 'true'

  s.files = Dir.glob('app/**/*') + Dir.glob('lib/**/*') + [
    'MIT-LICENSE',
    'README.md',
    'Gemfile',
    'stub_saml_idp.gemspec'
  ]
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.rdoc_options = ['--charset=UTF-8']
  s.add_development_dependency('nokogiri')
  s.add_development_dependency('rails', '>= 5.2')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~> 3.0')
  s.add_development_dependency('ruby-saml')
  s.add_development_dependency('timecop', '~> 0.9.0')
end
