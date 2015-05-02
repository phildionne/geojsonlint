require 'geojsonlint/version'
require 'json'
require 'json-schema'

if defined?(ActiveModel)
  require 'geojsonlint/geojson_validator'
end

module Geojsonlint

  class Parser
    attr_reader :schema, :data

    # @param data [String, Hash]
    def initialize(data)
      @data = data
      @schema = JSON.parse(File.read('./lib/geojsonlint/geojson_schema.json'))
      self
    end

    # @return [Geojson]
    def run
      options = {
        errors_as_objects: true,
        validate_schema: true
      }

      geojson = Geojson.new
      geojson.errors = JSON::Validator.fully_validate(@schema, @data, **options)

      geojson
    end
  end

  class Geojson
    attr_accessor :errors

    # @return [Geojson]
    def initialize
      self.errors = Array.new
      self
    end

    # @return [Boolean]
    def valid?
      !invalid?
    end

    # @return [Boolean]
    def invalid?
      errors.any?
    end
  end

  # Validates a geojson object
  # @param geojson [String, Hash] a JSON string or a Ruby object representing JSON data
  #
  # @return [Geojson]
  def validate(geojson)
    Parser.new(geojson).run
  end
  module_function :validate
end
