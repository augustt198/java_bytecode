# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'java_bytecode/version'

Gem::Specification.new do |spec|
  spec.name          = "java_bytecode"
  spec.version       = JavaBytecode::VERSION
  spec.authors       = ["August"]
  spec.email         = ["augustt198@gmail.com"]
  spec.summary       = %q{Java class file parser}
  spec.homepage      = "http://github.com/augustt198/java_bytecode"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
