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
        # clubs.each do |league_name, lclubs|
        #   league = League.where(name: league_name).first_or_create
        #   lclubs.each do |club|
        #     Club.where(location: club[:location], name: club[:name], league_id: league.id).first_or_create }



          
        # bleague = 
        # bunaclubs.each 
      end
    
      def clubs
        HTTParty.get("http://api.statsfc.com/premier-league/teams.json?key=vyl_oVGQVV80SwgqZB9EJfnjiB3fAd2keQST_xRC")
        # [{"id":9825,"name":"Arsenal","nameshort":"Arsenal","path":"arsenal"},{"id":10252,"name":"Aston Villa","nameshort":"Aston Villa","path":"aston-villa"},{"id":8344,"name":"Cardiff City","nameshort":"Cardiff","path":"cardiff-city"},{"id":8455,"name":"Chelsea","nameshort":"Chelsea","path":"chelsea"},{"id":9826,"name":"Crystal Palace","nameshort":"Crystal Palace","path":"crystal-palace"},{"id":8668,"name":"Everton","nameshort":"Everton","path":"everton"},{"id":9879,"name":"Fulham","nameshort":"Fulham","path":"fulham"},{"id":8667,"name":"Hull City","nameshort":"Hull","path":"hull-city"},{"id":8650,"name":"Liverpool","nameshort":"Liverpool","path":"liverpool"},{"id":8456,"name":"Manchester City","nameshort":"Man City","path":"manchester-city"},{"id":10260,"name":"Manchester United","nameshort":"Man Utd","path":"manchester-united"},{"id":10261,"name":"Newcastle United","nameshort":"Newcastle","path":"newcastle-united"},{"id":9850,"name":"Norwich City","nameshort":"Norwich","path":"norwich-city"},{"id":8466,"name":"Southampton","nameshort":"Southampton","path":"southampton"},{"id":10194,"name":"Stoke City","nameshort":"Stoke","path":"stoke-city"},{"id":8472,"name":"Sunderland","nameshort":"Sunderland","path":"sunderland"},{"id":10003,"name":"Swansea City","nameshort":"Swansea","path":"swansea-city"},{"id":8586,"name":"Tottenham Hotspur","nameshort":"Tottenham","path":"tottenham-hotspur"},{"id":8659,"name":"West Bromwich Albion","nameshort":"West Brom","path":"west-bromwich-albion"},{"id":8654,"name":"West Ham United","nameshort":"West Ham","path":"west-ham-united"}]
      end

      def matches_for(club)
        HTTParty.get("http://api.statsfc.com/premier-league/fixtures.json?key=vyl_oVGQVV80SwgqZB9EJfnjiB3fAd2keQST_xRC&team=#{club}")
      end 
      # def bundaclubs
      #   [{
      #     name: 'italy'
      #     },
      #     {name: 'some other place'},
      #     {}
      #   ]
      # end

      # def clubs
      #   {
      #     "engligh premeiere" => [{
      #       name: "arsenal",
      #       location: "london"
      #       },{}

      #     ],

      #     "bunda" => {


      #     }

      #   }
      # end
    end
  end
end
