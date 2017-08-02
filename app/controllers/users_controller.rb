class UsersController < ApplicationController
   def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_postings_path(current_user)
    else
      @error = @user.errors.full_messages
      respond_to do |format|
        format.js
        format.html { render template: "users/new" }
      end
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end
  
  def new
    @user = User.new
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

