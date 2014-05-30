# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wl4x/version'

Gem::Specification.new do |spec|
  spec.name          = "wl4x"
  spec.version       = Wl4x::VERSION
  spec.authors       = ["Vincent Heuken"]
  spec.email         = ["me@vincentheuken.com"]
  spec.summary       = "Game logic for Weblock, which uses the rules from Space Empires 4X board game"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
