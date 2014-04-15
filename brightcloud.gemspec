# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brightcloud/version'

Gem::Specification.new do |spec|
  spec.name          = "brightcloud"
  spec.version       = BrightCloud::VERSION
  spec.authors       = ["Sam Symons"]
  spec.email         = ["sam@samsymons.com"]
  spec.summary       = %q{A Ruby interface to the BrightCloud API.}
  spec.description   = %q{A Ruby interface to the BrightCloud API.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "vcr"

  spec.add_dependency "oauth"
  spec.add_dependency "nokogiri"
end
