# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'code_string'

Gem::Specification.new do |spec|
  spec.name          = "code_string"
  spec.version       = CodeString::VERSION
  spec.authors       = ["Brice Texier"]
  spec.email         = ["burisu@oneiros.fr"]
  spec.summary       = "String to manage codes"
  spec.description   = "Like AS::SafeBuffer, a way to manage code string safely for code generation"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
