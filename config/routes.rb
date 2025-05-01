Rails.application.routes.draw do
  # get "up" => "rails/health#show", as: :rails_health_check
  root to: "lists#index"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :list, only: :destroy
  resources :bookmarks, only: :destroy
end
