module SportsDataApi
  module Nfl
    class PlayerWeekStats
      attr_reader :id, :stats, :year, :season, :week

      STAT_TYPES = ["rushing", "receiving", "passing"]

      def initialize(year, season, week, xml)
        @year = year.to_i
        @season = season.to_sym
        @week = week.to_i

        xml = xml.first if xml.is_a? Nokogiri::XML::NodeSet

        if xml.is_a? Nokogiri::XML::Element
          @stats = {}
          rushing = []
          receiving = []
          passing = []

          xml.xpath("/game").xpath("team").each do |team|
            team.children.each do |category|
              if STAT_TYPES.include?(category.name)

                category.children.each do |player|
                  if player.name == "player"

                    if category.name == "rushing"

                      rushing_stats = {
                        :name => player['name'],
                        :position => player['position'],
                        :team => team['name'],
                        :rush_att => player['att'],
                        :rush_yds => player['yds'],
                        :rush_td => player['td'],
                        :fum_lost => player['fum']
                      }

                      rushing << rushing_stats

                      @stats[:rushing] = rushing

                    elsif category.name == "receiving"

                      receiving_stats = {
                        :name => player['name'],
                        :position => player['position'],
                        :team => team['name'],
                        :rec_tgt => player['tar'],
                        :receptions => player['rec'],
                        :rec_yds => player['yds'],
                        :rec_td => player['td'],
                        :fum_lost => player['fum']
                      }

                      receiving << receiving_stats

                      @stats[:receiving] = receiving

                    else

                      passing_stats = {
                        :name => player['name'],
                        :position => player['position'],
                        :team => team['name'],
                        :pass_att => player['att'],
                        :pass_comp => player['cmp'],
                        :pass_yds => player['yds'],
                        :pass_td => player['td'],
                        :pass_int => player['int']
                      }

                      passing << passing_stats

                      @stats[:passing] = passing
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
