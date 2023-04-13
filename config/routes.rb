Rails.application.routes.draw do
  # GET / => static_pages#home
  root 'static_pages#home'

  # GET /static_pages/home => static_pages#home
  # GET /about => static_pages#about
  get  'static_pages/home'
  get  'static_pages/help'
  get  'static_pages/about'
end
