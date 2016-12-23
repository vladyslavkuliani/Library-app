class LibraryUsersController < ApplicationController
  include SessionsHelper
  def index
    @user = User.find_by_id(params[:user_id])
    @libraries = @user.libraries
  end

  def create
    @library = Library.find(params[:library_id])
    @library.users.push(current_user)  # no error handling currently

    redirect_to current_user
  end
end
