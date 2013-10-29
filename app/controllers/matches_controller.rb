class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def index
    @matches = Match.where('schedule_date > ?', Time.now - 4.weeks)
    @all_matches = Match.all
    scores = HTTParty.get("http://espnfc.com/scores/_/league/eng.1/date/20131102/barclays-premier-league")
    doc = Nokogiri::HTML(scores)
    @groups = doc.css("#today-games .group-set")
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
