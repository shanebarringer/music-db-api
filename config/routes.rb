Rails.application.routes.draw do

  resources :albums 
  resources :artists do
    get '/albums/search-by-name' => 'albums#search_by_name'
    resources :albums do
      resources :songs
    end
  end

  root 'artists#index'

end
