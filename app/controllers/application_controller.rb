class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  FlickRaw.api_key = ENV["flickr_key"]
  FlickRaw.shared_secret = ENV["flickr_secret"]
end
