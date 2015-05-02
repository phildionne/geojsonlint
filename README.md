# Geojsonlint

Validate a `Hash` or a JSON `String` object.

## Usage

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

```ruby
class Feature
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :data

  validates :data, geojson: true
end

feature = Feature.new(data: data)
feature.valid?
feature.errors[:data] # => ["Invalid geojson"]
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

1. Fork it ( https://github.com/can-explore/geojsonlint/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Thank you!
## License

`geojsonlint` is © 2015 Can-Explore and may be freely distributed under the New BSD license. See the `LICENSE.md` file.

## About Can-Explore

Can-Explore is a team of passionate people brdiging the gap between technology and the world of civil engineering. We love building new things and get out of our comfort zone.

We love [open-source](https://github.com/can-explore) and we try to give back to the community as much as we can.
