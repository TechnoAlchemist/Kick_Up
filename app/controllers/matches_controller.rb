class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def index
    @matches = Match.where('schedule_date > ?', Time.now - 2.weeks)
  end

  def show
    @match = Match.find(params[:id])
    @comments = Comment.where(match_id: @match.id)
    @comment = Comment.new
  end

  private
  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :schedule_date, :half_time, :full_time)
  end
end
