class AdminsController < ApplicationController

  def index 
    @postings = Posting.all
  end 

  def destroy
    @posting = Posting.find_by_id(params[:id])
    @posting.destroy 
    redirect_to admins_path
  end
end
