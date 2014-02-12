CountTheCash::Application.routes.draw do
  root to: "envelopes#show"
  resources :envelopes, except: [:index]
  resources :users, except: [:index]
end
