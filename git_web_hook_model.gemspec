# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_web_hook_model/version'

Gem::Specification.new do |spec|
  spec.name          = "git_web_hook_model"
  spec.version       = GitWebHookModel::VERSION
  spec.authors       = ["Chuck J hardy"]
  spec.email         = ["chuckjhardy@gmail.com"]
  spec.description   = %q{Turn a Github WebHook into an object model}
  spec.summary       = %q{Turn a Github WebHook into an object model}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "id", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov", "~> 0.7.1"
  spec.add_development_dependency "rspec", "~> 2.13.0"
end
