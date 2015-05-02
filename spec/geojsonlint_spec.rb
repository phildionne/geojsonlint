require 'spec_helper'

describe Geojsonlint do
  let(:support_path) { File.expand_path('../support', __FILE__) }

  it "has a version number" do
    expect(Geojsonlint::VERSION).not_to be nil
  end

  describe :ModuleMethods do

    describe :validate do

      context "with data type" do
        describe "string" do
          let(:data) { JSON.dump({ type: 'Point', coordinates: [-105.01621, 39.57422] }) }

          it "does not raise error" do
            expect {
              Geojsonlint.validate(data)
            }.not_to raise_error
          end

          it "does not populate errors" do
            geojson = Geojsonlint.validate(data)
            expect(geojson.errors).to be_empty
          end
        end

        describe "symbolized hash" do
          let(:data) { { type: 'Point', coordinates: [-105.01621, 39.57422] } }

          it "does not raise error" do
            expect {
              Geojsonlint.validate(data)
            }.not_to raise_error
          end

          it "does not populate errors" do
            geojson = Geojsonlint.validate(data)
            expect(geojson.errors).to be_empty
          end
        end

        describe "stringified hash" do
          let(:data) { { 'type' => 'Point', 'coordinates' => [-105.01621, 39.57422] } }

          it "does not raise error" do
            expect {
              Geojsonlint.validate(data)
            }.not_to raise_error
          end

          it "does not populate errors" do
            geojson = Geojsonlint.validate(data)
            expect(geojson.errors).to be_empty
          end
        end
      end

      context "with valid" do

        describe "geometry" do

          describe "Point" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'point.json'))) }


            it "is valid" do
              expect(Geojsonlint.validate(geojson)).to be_valid
            end
          end

          describe "multiPoint" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'multipoint.json'))) }

            it "is valid" do
              expect(Geojsonlint.validate(geojson)).to be_valid
            end
          end

          describe "lineString" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'linestring.json'))) }

            it "is valid" do
              expect(Geojsonlint.validate(geojson)).to be_valid
            end
          end

          describe "multiLineString" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'multilinestring.json'))) }

            it "is valid" do
              expect(Geojsonlint.validate(geojson)).to be_valid
            end
          end

          describe "Polygon" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'polygon.json'))) }

            it "is valid" do
              expect(Geojsonlint.validate(geojson)).to be_valid
            end
          end

          describe "MultiPolygon" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'multipolygon.json'))) }

            it "is valid" do
              expect(Geojsonlint.validate(geojson)).to be_valid
            end
          end
        end

        describe "geometry colletion" do
          let(:geojson) { JSON.parse(File.read(File.join(support_path, 'geometrycollection.json'))) }

          it "is valid" do
            expect(Geojsonlint.validate(geojson)).to be_valid
          end
        end

        describe "feature" do
          let(:geojson) { JSON.parse(File.read(File.join(support_path, 'feature.json'))) }

          it "is valid" do
            expect(Geojsonlint.validate(geojson)).to be_valid
          end
        end

        describe "feature collection" do
          let(:geojson) { JSON.parse(File.read(File.join(support_path, 'featurecollection.json'))) }

          it "is valid" do
            expect(Geojsonlint.validate(geojson)).to be_valid
          end
        end
      end

      context "with invalid" do

        describe "geometry" do

          describe "Point" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_point.json'))) }

            it "is invalid" do
              expect(Geojsonlint.validate(geojson)).to be_invalid
            end
          end

          describe "multiPoint" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_multipoint.json'))) }

            it "is invalid" do
              expect(Geojsonlint.validate(geojson)).to be_invalid
            end
          end

          describe "lineString" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_linestring.json'))) }

            it "is invalid" do
              expect(Geojsonlint.validate(geojson)).to be_invalid
            end
          end

          describe "multiLineString" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_multilinestring.json'))) }

            it "is invalid" do
              expect(Geojsonlint.validate(geojson)).to be_invalid
            end
          end

          describe "Polygon" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_polygon.json'))) }

            it "is invalid" do
              expect(Geojsonlint.validate(geojson)).to be_invalid
            end
          end

          describe "MultiPolygon" do
            let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_multipolygon.json'))) }

            it "is invalid" do
              expect(Geojsonlint.validate(geojson)).to be_invalid
            end
          end
        end

        describe "geometry colletion" do
          let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_geometrycollection.json'))) }

          it "is invalid" do
            expect(Geojsonlint.validate(geojson)).to be_invalid
          end
        end

        describe "feature" do
          let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_feature.json'))) }

          it "is invalid" do
            expect(Geojsonlint.validate(geojson)).to be_invalid
          end
        end

        describe "feature collection" do
          let(:geojson) { JSON.parse(File.read(File.join(support_path, 'invalid_featurecollection.json'))) }

          it "is invalid" do
            expect(Geojsonlint.validate(geojson)).to be_invalid
          end
        end
      end
    end
  end
end
