Wam::Application.routes.draw do
  resources :talkabouts

  resources :profiles

  devise_for :users
  get "about" => "pages#about"
  root "profiles#index"
end
