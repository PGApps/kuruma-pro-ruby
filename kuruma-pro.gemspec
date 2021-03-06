# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'date'
require "kuruma-pro/version"

Gem::Specification.new do |gem|
  gem.name        = "kuruma-pro"
  gem.version     = KurumaPro::VERSION

  gem.authors     = ["Tatsuya Fukata"]
  gem.email       = ["tatsuya.fukata@gmail.com"]
  gem.summary     = gem.description = %q{kuruma.pro official SDK (Ruby)}
  gem.homepage    = "https://github.com/PGApps/kuruma-pro-ruby"
  gem.license     = 'MIT'

  gem.files       = `git ls-files`.split($\)
  gem.executables = []
  gem.test_files  = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.has_rdoc    = false

  gem.required_ruby_version = '>= 1.9.3'

  gem.add_dependency "rest-client", ["~> 2.0.0"]
  gem.add_dependency "json-schema", ["~> 2.8.0"]
  gem.add_development_dependency "rake", ["~> 12.3.0"]
  gem.add_development_dependency "rspec", ["~> 3.7.0"]
end
