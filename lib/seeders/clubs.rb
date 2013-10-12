module Seeders
  module Clubs
    class << self
      def seed
        league = League.where(name: "English Premier League").first_or_create
        clubs.each do |club|
          path = club["path"]
          name = club["name"]
          Club.where(location: 'United Kingdom', name: name, league_id: league.id).first_or_create

        end

        clubs = Club.pluck(:name).map{|club| club.downcase.gsub(' ', '-')}
        clubs.each do |path|
        matches = matches_for(path)



          matches.each do |match|
            home_team_id = Club.where(name: match["home"]).first.id
            away_team_id = Club.where(name: match["away"]).first.id
            schedule_date = match["date"]
            half_time = match["halftime"].join('-')
            full_time = match["fulltime"].join('-')

            Match.where(home_team_id: home_team_id, away_team_id: away_team_id, 
              schedule_date: schedule_date, half_time: half_time, full_time: full_time).first_or_create
          end
        end
      end
    
      def clubs
        HTTParty.get("http://api.statsfc.com/premier-league/teams.json?key=vyl_oVGQVV80SwgqZB9EJfnjiB3fAd2keQST_xRC")
      end

      def matches_for(club)
        HTTParty.get("http://api.statsfc.com/premier-league/results.json?key=vyl_oVGQVV80SwgqZB9EJfnjiB3fAd2keQST_xRC&team=#{club}")
      end 
    end
  end
end
