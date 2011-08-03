CarrierWave.configure do |config|
  
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => ENV['s3_access_key_id'],       # required
      :aws_secret_access_key  => ENV['s3_secret_access_key'],
      
      #:region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'Projoosr_Development/Avatars'                     # required
    #config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end