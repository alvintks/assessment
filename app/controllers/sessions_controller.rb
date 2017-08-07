class SessionsController < ApplicationController
   def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_postings_path(current_user.id)
    else
      flash[:notice] = "Invalid email/password"
      respond_to do |format|
        format.html { render template: "sessions/new" }
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end 
end 