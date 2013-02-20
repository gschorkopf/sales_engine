# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "sales_engine"
  gem.version       = "0.0.1"
  gem.authors       = ["Geoff Schorkopf"]
  gem.email         = ["gschorkopf@gmail.com"]
  gem.description   = %q{SalesEngine blah blah}
  gem.summary       = %q{Blah de blah}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
