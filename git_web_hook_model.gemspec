# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_web_hook_model/version'

Gem::Specification.new do |spec|
  spec.name          = "git_web_hook_model"
  spec.version       = GitWebHookModel::VERSION
  spec.authors       = ["Chuck J hardy"]
  spec.email         = ["chuckjhardy@gmail.com"]
  spec.description   = %q{Simple, immutable model for github webhooks.}
  spec.summary       = %q{Simple, immutable model for github webhooks.}
  spec.homepage      = "https://github.com/ChuckJHardy/GitWebHookModel"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "id", "~> 0.1"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rspec"
end
