Rails.application.routes.draw do
  resources :albums
  resources :artists do
    resources :albums do
      resources :songs 
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
