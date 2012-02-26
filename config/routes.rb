Crowdblog::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  #match '/auth/google_oauth2/callback', :to => 'sessions#authenticate_user'

  match '/:year/:month/:day/:id(.:format)', to: 'posts#show', as: 'post',
      constraints: { year: /\d+/ }

  match '/preview/:id', to: 'posts#show', constraints: { id: /\d+/ }, as: 'preview'

  match '/archive', to: 'archive#show', as: 'archive'

  match '/atom.(:format)', to: 'feeds/atom_feeds#show', as: 'atom_feed'

  mount Crowdblog::Engine => '/admin'

  root to: "posts#index"

end
