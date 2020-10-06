class UsersController < ApplicationController

  def show
    render file: "/public/401" unless current_user
  end

end
