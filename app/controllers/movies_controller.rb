require 'httparty'

class MoviesController < ApplicationController
  def index
    if params[:search].present?

      response = HTTParty.get("http://www.omdbapi.com/?s=#{params[:search]}&apikey=eeb40257")
      @movies = JSON.parse(response.body)['Search']
    else
      response = HTTParty.get('http://www.omdbapi.com/?s=latest&apikey=eeb40257')
      @movies = JSON.parse(response.body)['Search']
    end
  end

  def show
    response = HTTParty.get("http://www.omdbapi.com/?i=#{params[:id]}&apikey=eeb40257")
    movie_data = JSON.parse(response.body)

    if movie_data['Response'] == 'True'
      @movie = movie_data
    else
      redirect_to movies_path, alert: 'Movie not found.'
    end
  end

  def favorite
    response = HTTParty.get("http://www.omdbapi.com/?i=#{params[:id]}&apikey=eeb40257")
    movie_data = JSON.parse(response.body)

    if movie_data['Response'] == 'True'
      FavoriteMovie.create(title: movie_data['Title'], year: movie_data['Year'], imdb_id: movie_data['imdbID'])
      redirect_to favorites_path, notice: 'Movie added to favorites.'
    else
      redirect_to movies_path, alert: 'Movie not found.'
    end
  end

  def favorites
    @favorite_movies = FavoriteMovie.all
  end
end
