# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/autoscale/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-autoscale"
  spec.version       = Capistrano::Autoscale::VERSION
  spec.authors       = ["Damien Glancy"]
  spec.email         = ["support@clinch.io"]

  spec.summary       = %q{Capistrano plugin for deploying to AWS AutoScale groups.}
  spec.description   = %q{Deploys to all instances in a AWS AutoScale group.}
  spec.homepage      = "https://github.com/ClinchIO/capistrano-autoscale"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock"

  spec.add_dependency 'aws-sdk', '~> 2'
  spec.add_runtime_dependency 'capistrano', '~> 3.0', '> 3.0.0'
end
