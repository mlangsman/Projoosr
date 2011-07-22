class Video < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :panda_video_id
  
  def panda_video
    @panda_video ||= Panda::Video.find(panda_video_id)
  end
  
  def thumbnail
    panda_video.encodings.find_by_profile_name("h264").screenshots.first || "/images/placeholder_thumbnail.png"
  end

end
