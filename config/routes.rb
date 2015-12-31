Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :jobs
  resources :newsletters
  resource :subscriptions

  root to: "jobs#home"

  post '/subscriptions/charge', to: 'subscriptions#charge'
  post '/jobs', to: 'jobs#create', as: 'create_job'

end
