# -*- encoding: utf-8 -*-
require File.expand_path('../lib/resque-pigeon/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gerhard Lazu", "Carl Stanley"]
  gem.email         = ["gerhard@lazu.co.uk", "fandango118@hotmail.com"]
  gem.description   = %q{Delivers messages from resque using specific delivery methods (Twitter, Postmark etc.)}
  gem.summary       = %q{Abstracts delivery of messages when using resque}
  gem.homepage      = "https://github.com/gosquared/resque-pigeon"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "resque-pigeon"
  gem.require_paths = ["lib"]
  gem.version       = Resque::Pigeon::VERSION

  gem.add_development_dependency 'guard-minitest'
  #gem.add_development_dependency 'mailcatcher', '~> 0.5.6'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'turn'
  gem.add_development_dependency 'rake', '~> 0.9.2.2'

  gem.add_runtime_dependency 'json', '~> 1.6.6'
  gem.add_runtime_dependency 'mail', '~> 2.4.4'
  gem.add_runtime_dependency 'postmark', '~> 0.9.10'
  gem.add_runtime_dependency 'twitter', '~> 2.1.1'
end
