require 'spec_helper'
require 'active_model'
require 'geojsonlint/geojson_validator'

class Feature
  include ActiveModel::Validations

  def initialize(params={})
    params.each do |attr, value|
      self.public_send("#{attr}=", value)
    end if params

    super()
  end

  attr_accessor :geojson

  validates :geojson, geojson: true
end

describe GeojsonValidator do
  let(:support_path) { File.expand_path('../../support', __FILE__) }

  describe :IntanceMethods do

    describe :validate_each do
      let(:feature) { Feature.new(geojson: geojson) }
      before { feature.valid? }

      context "with valid geojson" do
        let(:geojson) { JSON.parse(File.read(File.join(support_path, 'point.json'))) }

        it "is valid" do
          expect(feature).to be_valid
        end

        it "does not populate errors" do
          expect(feature.errors).to be_empty
        end
      end

      context "with invalid geojson" do
        let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_point.json'))) }

        it "is invalid" do
          expect(feature).to be_invalid
        end

        it "populates errors" do
          expect(feature.errors).not_to be_empty
        end

        it "populates errors :geojson with 'Invalid geojson'" do
          expect(feature.errors[:geojson]).to eq(['is invalid'])
        end
      end
    end
  end
end


