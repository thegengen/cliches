# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cliches/version'

Gem::Specification.new do |spec|
  spec.name          = "cliches"
  spec.version       = Cliches::VERSION
  spec.authors       = ["Eugen Minciu"]
  spec.email         = ["eugen@gengen.io"]
  spec.summary       = "Rid your tests of boring, repetitive hashes."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "cane", "~> 3.0"
  spec.add_development_dependency "rdoc", "~> 4.0"
  spec.add_development_dependency "rake"
end
