class MoviesController < ApplicationController
  before_action :require_user
  def index
    return @movies = MovieFacade.search(params[:search]) if params[:search]

    @movies = MovieFacade.top_rated
  end
 #create a 'get_movie_details in the movies facade and call just that in the show'
  def show
    @movie = MovieFacade.get_movie_details(params[:id])
  end
end
