# Geojsonlint

A geoJSON validator.

[![Maintainability](https://api.codeclimate.com/v1/badges/1d1c9a8154c213675843/maintainability)](https://codeclimate.com/github/phildionne/geojsonlint/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/1d1c9a8154c213675843/test_coverage)](https://codeclimate.com/github/phildionne/geojsonlint/test_coverage)
[![Build Status](https://travis-ci.org/phildionne/geojsonlint.svg?branch=master)](https://travis-ci.org/phildionne/geojsonlint)

## Usage

Validate a `Hash` or a JSON `String` object.

```ruby
data = {
  type: 'Feature',
  geometry: {
    type: 'Point',
    coordinates: [-80.72, 35.26]
  },
  properties: {}
}

geojson = Geojsonlint.validate(data)
geojson.valid? # => true

data = {
  type: 'Feature',
  geometry: {
    type: 'Point',
    coordinates: 'invalid'
  },
  properties: {}
}

geojson = Geojsonlint.validate(data)
geojson.valid? # => false
geojson.errors # => [{ schema: {...}, fragment: "...", message: "...", failed_attribute: "...", errors: [...] }]
```

Also included is a custom validator for your `ActiveModel` objects.

```ruby
class Feature
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :data

  validates :data, geojson: true
end

feature = Feature.new(data: data)
feature.valid?
feature.errors[:data] # => ["Geojson is invalid""]
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geojsonlint'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geojsonlint

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/phildionne/geojsonlint/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Thank you!

## See Also

* [mapbox/geojsonhint](https://github.com/mapbox/geojsonhint)
* [geojsonhint online](https://www.mapbox.com/geojsonhint/)
* [grunt-geojsonhint](https://github.com/jieter/grunt-geojsonhint) does it as a Grunt task
* [geojsonlint.com](http://geojsonlint.com/) does this server-side
* [GeoJSON-Validation](https://github.com/craveprogramminginc/GeoJSON-Validation) is another node module for this.
* [geojson-assert](https://github.com/calvinmetcalf/geojson-assert) does it in assertion tests
