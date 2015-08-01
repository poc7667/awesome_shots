class WelcomeController < ApplicationController
  layout :_layout_by_resource
  def index
  end
  def setting
    
  end
  def show
    
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
