require 'active_model'

class GeojsonValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless valid_geojson?(value)
      message = options[:message] || "is invalid"
      record.errors.add(attribute, message)
    end
  end


  private

  # @return [Boolean]
  def valid_geojson?(geojson)
    Geojsonlint.validate(geojson).valid?
  end
end
