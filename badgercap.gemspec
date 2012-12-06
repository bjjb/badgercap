# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "badgercap"
  gem.version       = '0.0.1'
  gem.authors       = ["jjbuckley"]
  gem.email         = ["jj@bjjb.org"]
  gem.description   = %q{Opinionated VPS Capistrano tasks}
  gem.summary       = %q{This gem simplifies deployment of Rails apps to a VPS cluster}
  gem.homepage      = "http://github.com/jjbuckley/badgercap"

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'mocha'

  gem.add_dependency 'capistrano'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
