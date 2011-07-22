class VideosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
    def index
      logger.debug "\n\nindex called!\n\n" 
      @videos = Video.find(:all)
    end
    
    def show
      @video = Video.find(params[:id])
      @original_video = @video.panda_video
      @h264_encoding = @original_video.encodings.find_by_profile_name("h264")
    end

    def new
      @video = Video.new
    end

    def create
      # @order = @customer.orders.create(:order_date => Time.now)
      @video = current_user.videos.create!(params[:video])
       logger.debug "\n\ncurrent user:\n\n${current_user}\n\n" 
      # @video = Video.create!(params[:video])
      redirect_to :action => :show, :id => @video.id 
    end
    
    def edit
      @video = Video.find(params[:id])
    end
    
    def update
      @video = Video.find(params[:id])
      @video.update_attributes(params[:video])
      redirect_to :action => :index
    end
    
    def destroy
      logger.debug "\n\ndestroy called!\n\n" 
      @video = Video.find(params[:id])
      
      # Find and delete the Panda video
      @original_video = @video.panda_video
      @original_video.delete
      
      # delete the video database row
      @video.destroy
      
      redirect_to :action => :index
    end
  
end
