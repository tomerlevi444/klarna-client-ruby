# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'klarna/version'

Gem::Specification.new do |gem|
  gem.name          = "klarna"
  gem.version       = Klarna::VERSION
  gem.authors       = ["Daniel Salmeron Amselem"]
  gem.email         = ["daniel.amselem@klarna.com"]
  gem.description   = %q{XMLRPC Client to Klarna's API.}
  gem.summary       = %q{XMLRPC Client to Klarna's API.}
  gem.homepage      = ""

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "fuubar"
  gem.add_development_dependency "debugger"
  gem.add_development_dependency 'factory_girl'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'dotenv'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
