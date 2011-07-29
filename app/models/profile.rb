class Profile < ActiveRecord::Base
  #attr_accessible :avatar, :first_name, :last_name, :bio, :location
  belongs_to :user
  
  # Carrierwave uploader
  mount_uploader :avatar, AvatarUploader
  
end
