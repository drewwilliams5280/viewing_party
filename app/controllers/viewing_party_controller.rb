class ViewingPartyController < ApplicationController
  before_action :require_user
  def new
    @movie = MovieFacade.movie_details(params[:id])
  end
end
