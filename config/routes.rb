Rails.application.routes.draw do
  root to: "lists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: :index
  resources :lists, only: [:show, :new, :create] do
    resources :bookmarks
  end
  resources :bookmarks, only: :destroy
end
