class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  
  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
  
  protected

  def authenticate
    if ENV['RAILS_KEY'] == "production"
        authenticate_or_request_with_http_basic do |username, password|
          username == ENV['HTTP_USER'] && password == ENV['HTTP_PWD']
        end
    end
  end
  
end
