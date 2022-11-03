Rails.application.routes.draw do
  root "planes#index"
  
  post "/planes", to: "planes#create"
  # resources :planes
  # resources :flights
  resources :planes do
    resources :flights
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
