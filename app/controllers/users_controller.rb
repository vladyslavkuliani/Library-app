class UsersController < ApplicationController
  before_action :authorization, except: [:index, :new, :create]
  include SessionsHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def authorization
    user = User.find_by_id(params[:id])
    if !current_user
      flash[:notice] = "You have to log in first!"
      redirect_to login_path
    elsif params[:id] && current_user!=user
      flash[:notice] = "You're not allowed to see other users personal pages!"
      redirect_to user_path(current_user)
    end
  end

  def show_all
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
