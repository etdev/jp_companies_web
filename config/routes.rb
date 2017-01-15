Rails.application.routes.draw do
  root to: "homes#show"

  resources :en_hyouban_entries, only: [:show, :index]
  resources :vorkers_entries, only: [:show, :index]
  resources :companies, only: [:index, :show]
end
