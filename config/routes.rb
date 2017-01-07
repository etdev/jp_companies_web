Rails.application.routes.draw do
  root to: "homes#show"

  resources :en_hyouban_entries, only: :show
end
