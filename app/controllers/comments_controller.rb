class CommentsController < ApplicationController
  def new 
    @comment = Comment.new
    @posting = Posting.find_by_id(params[:posting_id])
  end 

  def create 
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.posting_id = params[:posting_id]
    @posting = Posting.find_by_id(params[:posting_id])
    if @comment.save
      redirect_to user_postings_path(current_user)
    else
      redirect_to new_user_posting_comment_path(current_user, @posting)
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:description)
  end

end
