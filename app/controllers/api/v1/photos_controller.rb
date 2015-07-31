class Api::V1::PhotosController < ApplicationController
  RTN_LIMIT = 300
  def search
    photos = Photo.limit(RTN_LIMIT)
              .geo_near([params["lon"].to_f, params["lat"].to_f])
              .max_distance(params["distance"].to_f)
              .to_a
    respond_to do |format|
      format.json { render json:  photos.sort_by { |hits| hits }}
    end
  end
end