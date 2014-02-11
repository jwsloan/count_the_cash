CountTheCash::Application.routes.draw do
  root to: "envelopes#show"
  resources :envelopes, except: [:index]
  resources :users, except: [:index]
  match "/signup", to: "users#new", via: "get"
end
