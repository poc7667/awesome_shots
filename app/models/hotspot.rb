class Hotspot
  include Mongoid::Document
  include Mongoid::Geospatial
  field :title, type: String
  field :url, type: String
  field :image, type: String
  geo_field :location

end


# 雞
#     "25.0267474",
#     ""

#     http://localhost:3000/api/v1/photo/search?lon=120.29305361110999684&lat=22.616960555555998269&distance=100
#     http://localhost:3000/api/v1/hotspots/search?lon=121.5223709&lat=25.0267474&distance=100&title='怪味'