Rails.application.routes.draw do

  root 'static_page#home'
  delete '/logout', to: 'static_page#destroy'
end
