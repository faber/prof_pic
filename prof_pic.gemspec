# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "prof_pic"
  spec.version       = "0.0.1"
  spec.authors       = ["David Faber"]
  spec.email         = ["david@1bios.co"]
  spec.summary       = %q{Profile pic abstraction for various providers}

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]


  spec.add_development_dependency 'rake', '~> 10.1.0'
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rspec", "~> 3.0.0.beta1"
end
