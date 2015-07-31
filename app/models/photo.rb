class Photo
  include Mongoid::Document

  field :location, type: Array

  index({location: "2d"})

  validates :location, location: true
end
