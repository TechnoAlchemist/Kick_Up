class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @match = Match.find(params[:match_id])
  end

  def create
    @comment = Comment.new(comment_params)
    # binding.pry
    @match = Match.find(params[:match_id])
    @comment.user_id = current_user.id
    @comment.match = @match


    if @comment.save
      redirect_to match_path(@match)
    else
      flash[:notice] = "You must write an entry before submitting comments"
      @vote = Vote.new
      render "matches/show"
      # render action: 'show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :match_id)
  end
end
