class SessionsController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    user = User.confirm(user_params)
    if user
      login(user)
      redirect_to user_path(user)
    else
      redirect_to login_path(user)
    end
  end

  def destroy
    logout
    redirect_to users_path
  end
end
