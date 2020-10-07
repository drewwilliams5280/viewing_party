class FriendshipsController < ApplicationController
  def create
      user = User.find(current_user.id)
      friend = User.find_by(email: params[:email])
      friendship = Friendship.new(user: user, friend: friend)
      friendship2 = Friendship.new(user: friend, friend: user)

    if friendship.save && friendship2.save
      redirect_to '/dashboard'
      flash[:success] = "Friend successfully added"
    else
      redirect_to '/dashboard'
      flash[:error] = "Sorry your friend cannot be found"
    end
  end

end
