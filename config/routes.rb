Rails.application.routes.draw do
  root to: "companies#index"

  resources :en_hyouban_entries, only: [:show, :index]
  resources :vorkers_entries, only: [:show, :index]
  resources :companies, only: [:index, :show, :edit, :update]
  resources :company_registrations, only: [:new, :create]
  resources :company_searches, only: [:index]
end
