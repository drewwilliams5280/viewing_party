class SessionsController < ApplicationController
  def create
    if (user = User.find_by(email: params[:email]))
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Success, you are now logged in as #{user.name}"
        redirect_to '/dashboard'
      else
        flash[:error] = 'Your login credentials are incorrect'
        redirect_to root_path
      end
    else
      flash[:error] = 'Your login credentials are incorrect'
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You have been logged out'
    redirect_to root_path
  end
end
