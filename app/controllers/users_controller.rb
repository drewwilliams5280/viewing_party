class UsersController < ApplicationController
  def show
    render file: '/public/401' unless current_user
  end

  def new; end

  def create
    @user = User.new(user_params)
    if params[:password] == params[:password_confirmation] && @user.save
      session[:user_id] = @user.id
      flash[:success] = 'You are now registered and logged in'
      redirect_to '/dashboard'
    elsif params[:password] != params[:password_confirmation]
      flash[:alert] = 'Passwords do not match'
      render :new
    else
      flash.now[:alert] = @user.errors.full_messages.first
      render :new
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
