class SessionsController < ApplicationController
   def create
    byebug
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_postings_path
    else
      flash[:notice] = "Invalid email/password"
      respond_to do |format|
        format.js
        format.html { render template: "sessions/new" }
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end 
end 