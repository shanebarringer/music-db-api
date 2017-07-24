Rails.application.routes.draw do
  resources :albums, only: [:index, :show]
  resources :artists, only: [:index, :show] do
    resources :albums, only: [:index, :show] do
      resources :songs, only: [:index, :show] 
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
