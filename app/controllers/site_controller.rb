class SiteController < ApplicationController
  def index
    #@videos = Video.find(:all)
    @videos = Video.find_all_by_published(true)
  end

  def about
  end

end
