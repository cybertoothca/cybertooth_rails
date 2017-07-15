# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cybertooth_rails/version'

Gem::Specification.new do |spec|
  spec.name = 'cybertooth_rails'
  spec.version = CybertoothRails::VERSION
  spec.authors = ['Dan Nelson']
  spec.email = ['dan.nelson@cybertooth.io']

  spec.summary = 'This is a summary.'
  spec.description = 'This is a description.'
  spec.homepage = 'https://github.com/cybertoothca/cybertooth_rails'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '~> 5.1'
  spec.add_dependency 'aws-sdk', '~> 2.10'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rubocop', '0.49.1'
end
