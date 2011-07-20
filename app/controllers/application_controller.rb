class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  
  protected

  def authenticate
    if ENV['RAILS_KEY'] == "production"
        authenticate_or_request_with_http_basic do |username, password|
          username == ENV['HTTP_USER'] && password == ENV['HTTP_PWD']
        end
    end
  end
  
end
