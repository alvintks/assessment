class PostingsController < ApplicationController
  def index 
    @postings = Posting.where(user_id: current_user.id)
     if !params[:search].blank?
      @posting_search = Posting.search(params[:search]).order("created_at DESC")
      @user_search = User.search(params[:search]).order("created_at DESC")
    end
  end 

  def new 
    @posting = Posting.new
  end 

  def show 
    @posting = Posting.find_by_id(params[:id])
  end 

 def create 
  @posting = Posting.new(posting_params)
  @posting.user_id = current_user.id
    if @posting.save
      redirect_to user_postings_path(current_user.id)
    else
      flash[:notice] = "Something went wrong. Try again."
      respond_to do |format|
        format.html { render template: "postings/new" }
      end 
    end
  end

  def upvote
    @posting = Posting.find(params[:id])
    @posting.upvote_by current_user
    respond_to do |format|
    format.html { redirect_to user_postings_url(current_user.id), notice: 'Like was increased.' }
    format.js { }
    end 
  end 

 
private 
  def posting_params 
    params.require(:posting).permit(:description, :image, :address)
  end 
end
