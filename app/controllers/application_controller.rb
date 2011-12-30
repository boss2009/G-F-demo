class ApplicationController < ActionController::Base
  protect_from_forgery
  
# + Dec.28.2011
	rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found

protected

  
  def render_not_found
    render template: "pages/404", status: 404
  end
  
end
