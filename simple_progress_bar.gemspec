# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "simple_progress_bar"
  spec.version       = "0.1.0"
  spec.authors       = ["iPet"]
  spec.email         = ["patrick-salij@hotmail.com"]

  spec.summary       = "SimpleProgressBar is an easy to use progress bar that can be used to keep track of the progress."
  spec.homepage      = "http://github.com/iPet/SimpleProgressBar"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
