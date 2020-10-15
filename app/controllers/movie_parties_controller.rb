class MoviePartiesController < ApplicationController
  before_action :require_user
  def new
    @movie = MovieFacade.movie_details(params[:id])
  end

  def create
    party = MovieParty.create!(party_params)
    friends = params['users'][current_user.id.to_s]
    friends.each do |user_id|
      PartyGuest.create(movie_party_id: party.id, guest_id: user_id)
    end
    flash[:success] = "Viewing party created for #{party.movie_title} on #{party.date}"
    redirect_to '/dashboard'
  end

  private

  def party_params
    params.permit(:movie_id, :movie_title, :runtime, :date, :time, :user_id)
  end
end
