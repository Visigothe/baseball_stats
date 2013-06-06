class CreateHitters < ActiveRecord::Migration
  def change
    create_table :hitters do |t|
      t.string :year
      t.string :league_name
      t.string :division_name
      t.string :team_city
      t.string :team_name
      t.string :surname
      t.string :given_name
      t.string :position
      t.integer :games
      t.integer :games_started
      t.integer :at_bats
      t.integer :runs
      t.integer :hits
      t.integer :doubles
      t.integer :triples
      t.integer :home_runs
      t.integer :rbi
      t.integer :steals
      t.integer :caught_stealing
      t.integer :sacrifice_hits
      t.integer :sacrifice_flies
      t.integer :fielding_errors
      t.integer :pb
      t.integer :walks
      t.integer :struck_out
      t.integer :hit_by_pitch
      t.float :avg
      t.float :obp
      t.float :slg
      t.float :ops

      t.timestamps
    end
  end
end
