# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or ImageScience support:
  include CarrierWave::RMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  #process :scale => [300, 300]
  
  process :resize_to_fill => [300, 300]
  process :convert => 'png'
  
  version :thumb do 
    process :resize_to_fill => [75, 75] 
    process :convert => 'png' 
  end
  
  version :tiny do 
    process :resize_to_fill => [30, 30] 
    process :convert => 'png' 
  end
  
  #Create a unique random filename
  def filename
     "#{secure_token}.png" if original_filename.present?
  end

  protected
    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(10))
    end
  
  
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  #version :thumb do
   #  process :scale => [50, 50]
  #end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
