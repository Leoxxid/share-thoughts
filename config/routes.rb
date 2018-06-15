Rails.application.routes.draw do
  root to: 'thoughts#index'
  resources :thoughts
  devise_for :users
  post '/thought/:thougth_id/observation/', to: 'observations#create',
                                            as: 'create_observation'
  get 'react/:reactable_type/:reactable_id/:reaction', to: 'reacts#react'
  get 'react-delete/:reactable_type/:reactable_id', to: 'reacts#remove_reaction'

end
