Rails.application.routes.draw do

  resources :albums, only: [:index, :show]
  resources :artists, only: [:index, :show] do
    resources :albums, only: [:index, :show] do
      resources :songs, only: [:index, :show]
    end
  end

  root 'artists#index'
  
end
