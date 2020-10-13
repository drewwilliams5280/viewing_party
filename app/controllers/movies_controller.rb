class MoviesController < ApplicationController

  def index
    if params[:search]
      @movies = MovieFacade.search(params[:search])
    else
      @movies = MovieFacade.top_rated
    end
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
  end

end
