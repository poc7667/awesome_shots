class Photo
  include Mongoid::Document
  include Mongoid::Geospatial

  field :link, type: String
  field :url, type: String
  field :thumb, type: String
  field :hits, type: Integer
  field :uploaded_at, type: Time
  # field :location, type: Array
  # field :location, type: Point
  geo_field :location
  # index({location: "2d"},)
  # sphere_index :location  # 2d


  # validates :location, location: true
end
