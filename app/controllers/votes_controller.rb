class VotesController < ApplicationController
  def new
    @vote = Vote.new
    @match = Match.find(params[:match_id])
  end

  def create
    @vote = Vote.new(vote_params)
    @match = Match.find(params[:match_id])
    @vote = Vote.find_by(:user => current_user, :match => @match)
    if @vote.nil?
      @vote = Vote.new(:user => current_user, :match => @match)
    end
    @vote.value = vote_params[:value]
    @vote.user_id = current_user.id
    @vote.match = @match
    if @vote.save
      redirect_to match_path(@match)
    else
      flash[:notice] = "You can only vote once in either direction"
      render template: "matches/show"
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:value)
  end
end
