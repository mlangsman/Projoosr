class VideosController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
    def index
      logger.debug "\n\nindex called!\n\n" 
      # @videos = Video.find(:all)
      @videos = current_user.videos
    end
    
    def show
      begin
        @video = Video.find(params[:id])
        # If the requested video isnt published 
        if @video.published?
          @original_video = @video.panda_video
          @h264_encoding = @original_video.encodings.find_by_profile_name("h264") 
        else 
          #render_404
          respond_to do |format|
            if @video.user = current_user
              flash.now[:notice] = "Your video is being encoded and reviewed. We'll let you know as soon as it's ready!"
            else
              flash.now[:notice] = "This video has not been published yet. Check back soon..."
            end
            format.html { render :template => "videos/unavailable", :layout => true }
          end
        end
        rescue ActiveRecord::RecordNotFound
          render_404
      end
    
      
    end

    def new
      @video = Video.new
    end

    def create
      @video = current_user.videos.create!(params[:video])
      redirect_to :action => :show, :id => @video.id 
    end
    
    def edit
      begin
        @video = current_user.videos.find(params[:id])
      end
      rescue ActiveRecord::RecordNotFound
        render_404
    end
    
    def update
      begin
        @video = current_user.videos.find(params[:id])
        @video.update_attributes(params[:video])
        redirect_to :action => :index
      end
      rescue ActiveRecord::RecordNotFound
        render_404      
    end
    
    def destroy 
      begin
        @video = current_user.videos.find(params[:id])
        
      # delete the video database row
      @video.destroy
        
      # Find and delete the Panda video
      @original_video = @video.panda_video
      @original_video.delete
      redirect_to :action => :index
      end
        rescue ActiveRecord::RecordNotFound
          render_404
    end
    
        
  
end
