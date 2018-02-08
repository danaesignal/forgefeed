class StaticPageController < ApplicationController
  include StaticPageHelper
  def home
    log_in(params[:flickr])

    if logged_in?
      begin
        user_id = flickr.people.findByUsername(username: current_user)['id']
        @photostream = flickr.people.getPublicPhotos(user_id: user_id)
      rescue FlickRaw::FailedResponse
        flash[:alert] = "User not found."
        log_out unless current_user.nil?
        redirect_to root_path
      end
    end
  end

  def destroy
    log_out unless current_user.nil?
    redirect_to root_path
  end
end
