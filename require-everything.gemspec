# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'require-everything/version'

Gem::Specification.new do |s|
  s.name = 'require-everything'
  s.version = RequireEverything::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Noah H. Smith']
  s.email = ['noah@rendergardenmedia.com']
  s.homepage = 'https://github.com/noazark/require-everything'
  s.summary = 'Require javascripts, templates and stylesheets with RequireJS though the asset pipeline'

  s.add_development_dependency 'rails', ['~> 3.1.0.rc5']
  s.add_development_dependency 'requirejs-rails'
  
  s.files = %w(README.md) + Dir['lib/**/*', 'vendor/**/*']

  s.require_path = ['lib']
end
