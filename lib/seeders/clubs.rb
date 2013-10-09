module Seeders
  module Clubs
    class << self
      def seed
        league = League.where(name: "English Premier League").first_or_create
        clubs.each do |club|
          path = club["path"]
          name = club["name"]
          Club.where(location: 'United Kingdom', name: name, league_id: league.id).first_or_create

          matches = matches_for(path)


          matches.each do |match|
            home_team = match["home"]
            away_team = match["away"]
            schedule_date = match["date"]

            Match.where(home_team: home_team, away_team: away_team, 
              schedule_date: schedule_date).first_or_create
          end
        end
      end
    
      def clubs
        HTTParty.get("http://api.statsfc.com/premier-league/teams.json?key=vyl_oVGQVV80SwgqZB9EJfnjiB3fAd2keQST_xRC")
      end

      def matches_for(club)
        HTTParty.get("http://api.statsfc.com/premier-league/fixtures.json?key=vyl_oVGQVV80SwgqZB9EJfnjiB3fAd2keQST_xRC&team=#{club}")
      end 
    end
  end
end
