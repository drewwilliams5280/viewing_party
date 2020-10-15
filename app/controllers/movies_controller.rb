class MoviesController < ApplicationController
  before_action :require_user
  def index
    return @movies = MovieFacade.search(params[:search]) if params[:search]
    return @movies = MovieFacade.upcoming if params[:upcoming]

    @movies = MovieFacade.top_rated
  end

  def show
    @movie = MovieFacade.get_movie_details(params[:id])
  end
end
