# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.development?
    ENV['MONGO_URL'] = 'mongo-sb:27017'
end