Rails.application.routes.draw do
  root 'movies#index'
  get '/movies', to: 'movies#index' # For all movies
  get '/movies/:id', to: 'movies#show', as: 'movie' # for details 
  post '/movies/:id/favorite', to: 'movies#favorite', as: 'favorite_movie' # for add to favorites
  get '/favorites', to: 'movies#favorites', as: 'favorites' # for all favorites
  get '/movies/:id/favorite', to: 'movies#favorite', as: 'favorite_movie_get' 
end