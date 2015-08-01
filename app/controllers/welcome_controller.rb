class WelcomeController < ApplicationController
  protect_from_forgery with: :null_session
  layout :_layout_by_resource
  def index
  end
  def setting
    
  end
  def show
    if current_user.email.include? 'poc'
      @file = "route_1.json"
    else
      @file = "route_2.json"
    end
  end

  def add_routes
    routes = request.raw_post.to_s.encode('UTF-8', {:invalid => :replace, :undef => :replace, :replace => '?'})
    respond_to do |format|
      format.json { render json: 'ok'.to_json }
    end
  end

  def get_route
    user = current_user
    user.routes.last =
    respond_to do |format|
      format.json { render json: results }
    end
    # SERVER/get_route
    # current_user get lastes route
  end

  private
    def _layout_by_resource
      case action_name
      when 'show'
        'storymap'
      when 'setting'
        'storymap'
      else
        'application'
      end
    end
end
