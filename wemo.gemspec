# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wemo/version'

Gem::Specification.new do |spec|
  spec.name          = "wemo"
  spec.version       = Version::VERSION
  spec.authors       = [""]
  spec.email         = [""]
  spec.summary       = %q{foo}
  spec.description   = %q{bar}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "savon"

  spec.required_ruby_version = ">= 2.0.0"
end
