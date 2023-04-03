Rails.application.routes.draw do
  resources :female_wolves
  resources :male_wolves
  resources :foundation_wolves
  resources :available_puppies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
