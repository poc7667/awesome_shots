class Hotspot
  include Mongoid::Document
  include Mongoid::Geospatial
  field :title, type: String
  field :url, type: String
  field :image, type: String
  geo_field :location

end
