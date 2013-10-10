class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def show
    @match = Match.find(params[:id])
    @comment = Comment.new
  end

  private
  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :schedule_date, :half_time, :full_time)
  end
end
