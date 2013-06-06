class Hitter < ActiveRecord::Base
  attr_accessible :at_bats, :avg, :caught_stealing, :division_name, :doubles, 
                  :fielding_errors, :games, :games_started, :given_name, :hit_by_pitch, 
                  :hits, :home_runs, :league_name, :obp, :ops, :pb, :position, :rbi, 
                  :runs, :sacrifice_flies, :sacrifice_hits, :slg, :steals, :struck_out, 
                  :surname, :team_city, :team_name, :triples, :walks, :year

  def self.parse_xml
    self.destroy_all
    HitterParser.new.hitters{ |hitter_record| create! hitter_record }
  end
end
