module StaticPageHelper
  def log_in(flickr)
    session[:id] = flickr[:id] if params[:flickr]
  end

  def log_out
    session[:id] = nil
  end

  def current_user
    @current_user = session[:id] || ""
  end

  def logged_in?
    !current_user.empty?
  end

  def get_info(photo)
    flickr.photos.getInfo(photo_id: photo['id'])
  end
end
