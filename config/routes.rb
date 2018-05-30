Rails.application.routes.draw do
  resources :shortened_urls
  get '/:some_short_code' => 'short_url#view'

  # You can have the root of your site routed with "root"
  root 'shortened_urls#new'
end
