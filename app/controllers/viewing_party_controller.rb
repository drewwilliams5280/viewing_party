class ViewingPartyController < ApplicationController
  before_action :require_user
  def new
    @movie = MovieFacade.movie_details(params[:id])
  end

  def create
    # party = ViewingParties.create(party_params)
    # friends = params[:users][:id] unless params[:users].nil?
    # unless friends.nil?
    #   friends.each do |user_id|
    #     PartyGuests.create(viewing_party_id: party.id, guest_id: user_id)
    #   end
    # end

    require "pry"; binding.pry
    redirect_to '/dashboard'
  end



  private

  def party_params
    params.permit(:movie_id, :movie_title, :runtime, :date, :time, :user_id)
  end
end
