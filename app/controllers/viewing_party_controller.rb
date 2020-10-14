class ViewingPartyController < ApplicationController
  before_action :require_user
  def new
    @movie = MovieFacade.movie_details(params[:id])
  end

  def create
    # require "pry"; binding.pry
    # redirect_to '/dashboard'
  end
end
