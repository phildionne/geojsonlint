lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geojsonlint/version'

Gem::Specification.new do |spec|
  spec.name          = "geojsonlint"
  spec.version       = Geojsonlint::VERSION
  spec.authors       = ["Philippe Dionne"]
  spec.email         = ["dionne.phil@gmail.com"]

  spec.summary       = %q{A geojson validator.}
  spec.description   = %q{A geojson validator.}
  spec.homepage      = "http://github.com/phildionne/geojsonlint"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json-schema", "~> 2.8"
  spec.add_dependency "activemodel", ">= 3.0.0"
end
