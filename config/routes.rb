CountTheCash::Application.routes.draw do
  get "denominations/index"
  get "denominations/show"
  get "denominations/new"
  get "denominations/edit"
  get "denominations/create"
  get "denominations/update"
  get "denominations/destroy"
  resources :envelopes
  resources :denominations
  resources :budgets
  root 'denominations#index'
end
