CountTheCash::Application.routes.draw do
  root to: "envelopes#show"
  resources :envelopes, except: [:index]
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
end
