Rails.application.routes.draw do
  root "planes#index"
  resources :planes
  resources :flights
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
