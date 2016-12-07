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
  spec.description   = %q{Capistrano plugin for deploying to AWS AutoScale groups.}
  spec.homepage      = "https://github.com/ClinchIO/capistrano-autoscale"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency 'aws-sdk', '~> 2'
  spec.add_runtime_dependency 'capistrano', '~> 3.0', '> 3.0.0'
end
