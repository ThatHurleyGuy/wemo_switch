# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wemo_switch/version'

Gem::Specification.new do |spec|
  spec.name          = "wemo_switch"
  spec.version       = Version::VERSION
  spec.authors       = ["hurley and kjperry"]
  spec.email         = ["sean.hurley6@gmail.com"]
  spec.summary       = %q{Gem to control wemo switch devices}
  spec.description   = %q{This gem can be used to control wemo switch devices to control power outlets}
  spec.homepage      = "https://github.com/seanhurley/wemo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rspec-mocks", "~> 3.2"
  spec.add_dependency "savon", "~> 2.11"

  spec.required_ruby_version = ">= 2.0.0"
end
