class SiteController < ApplicationController
  def index
    @videos = Video.find(:all)
  end

  def about
  end

end
