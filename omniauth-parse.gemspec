# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-parse/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Micah Gates", "Chris Bielinski"]
  gem.email         = ["github@mgates.com"]
  gem.description   = %q{An Omniauth Strategy for Parse.com}
  gem.summary       = %q{An Omniauth Strategy for Parse.com}
  gem.homepage      = "https://github.com/mgates/omniauth-parse"
  gem.name        = "omniauth-parse"
  gem.version     = OmniAuth::Parse::VERSION
  gem.summary     = %q{OmniAuth strategy for Parse}
  gem.description = %q{OmniAuth strategy for Parse}
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth'
  gem.add_dependency 'multi_json'
  gem.add_dependency 'faraday'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'webmock'
end

