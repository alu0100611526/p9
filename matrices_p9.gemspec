# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrices_p9/version'

Gem::Specification.new do |gem|
  gem.name          = "matrices_p9"
  gem.version       = MatricesP9::VERSION
  gem.authors       = ["Luis Orta, Adriana Rolo"]
  gem.email         = ["alu0100611526@ull.edu.es, alu0100658712@ull.edu.es"]
  gem.description   = %q{Gema para realizar suma entre matrices densas y matrices dispersas}
  gem.summary       = %q{matrices densas y dispersas}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

 gem.add_development_dependency 'rspec', '~>2.11'
end
