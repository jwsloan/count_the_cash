CountTheCash::Application.routes.draw do
  root to: 'budgets#index'
  resources :envelopes
  resources :denominations
  resources :budgets
end
