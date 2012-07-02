# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Micah Gates"]
  gem.email         = ["github@mgates.com"]
  gem.description   = %q{An Omniauth Strategy for Parse.com}
  gem.summary       = %q{An Omniauth Strategy for Parse.com}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-parse-com"
  gem.require_paths = ["lib"]
  gem.version       = '0.0.1'
end
