# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Projoosr::Application.initialize!

config.gem "panda", :version => ">= 1.0.0", :source => "http://gemcutter.org"

