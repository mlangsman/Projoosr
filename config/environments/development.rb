Projoosr::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
  
  # ActionMailer / Devise config
  config.action_mailer.perform_deliveries = true 
  config.action_mailer.delivery_method = :sendmail #:smtp
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options   = { :host => 'localhost:3000' }   
  
  # Panda config
  ENV['PANDASTREAM_URL'] = "http://c80dbcee4c037bb80ceb:3e663336fd3408275159@api.pandastream.com:80/4791c3e54b94977441471683df792e8b"
  
  # CarrierWave Config
  ENV['s3_access_key_id'] = "AKIAJPHNWZPBAI2HR5OQ" 
  ENV['s3_secret_access_key'] = "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"
  ENV['s3_bucket'] = "Projoosr_Development"

end

