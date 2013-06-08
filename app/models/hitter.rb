class Hitter < ActiveRecord::Base

  attr_accessible :year, :league_name, :division_name, :team_name, :team_city, 
                  :position, :surname, :given_name, :games, :games_started, 
                  :at_bats, :runs, :hits, :doubles, :triples, :home_runs, :rbi, 
                  :steals, :caught_stealing, :sacrifice_hits, :sacrifice_flies, 
                  :pb, :walks, :struck_out, :hit_by_pitch, :fielding_errors, 
                  :avg, :obp, :slg, :ops

  def self.parse_xml(source)
    self.destroy_all
    HitterParser.new(source).hitters
  end

  def self.create_hitter_from_record(record)
    self.new(record).save
  end
end
