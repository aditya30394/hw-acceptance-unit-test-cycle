Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  match '/movies/samdDirecto/:id/', to: 'movies#movie_with_same_director', as: 'same_director', via: :get
end
