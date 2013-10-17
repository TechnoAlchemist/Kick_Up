class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def index
    @matches = Match.where('schedule_date > ?', Time.now - 2.weeks)
    @all_matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    @comments = Comment.where(match_id: @match.id)
    @comment = Comment.new
    @votes = Vote.where(match_id: @match.id)
    @vote = Vote.new
  end

  private
  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :schedule_date, :half_time, :full_time)
  end
end
