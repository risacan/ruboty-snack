# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/snack/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-snack"
  spec.version       = Ruboty::Snack::VERSION
  spec.authors       = ["Risa Harada"]
  spec.email         = ["supikateriburu@gmail.com"]

  spec.summary       = %q{Ruboty gives you a snack.}
  spec.homepage      = "https://github.com/risacan/ruboty-snack"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "ruboty"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
