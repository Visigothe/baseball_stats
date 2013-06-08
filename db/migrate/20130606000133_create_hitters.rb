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
      t.integer :games,             default: 0
      t.integer :games_started,     default: 0
      t.integer :at_bats,           default: 0
      t.integer :runs,              default: 0
      t.integer :hits,              default: 0
      t.integer :doubles,           default: 0
      t.integer :triples,           default: 0
      t.integer :home_runs,         default: 0
      t.integer :rbi,               default: 0
      t.integer :steals,            default: 0
      t.integer :caught_stealing,   default: 0
      t.integer :sacrifice_hits,    default: 0
      t.integer :sacrifice_flies,   default: 0
      t.integer :fielding_errors,   default: 0
      t.integer :pb,                default: 0
      t.integer :walks,             default: 0
      t.integer :struck_out,        default: 0
      t.integer :hit_by_pitch,      default: 0
      t.float :avg,                 default: 0.0
      t.float :obp,                 default: 0.0
      t.float :slg,                 default: 0.0
      t.float :ops,                 default: 0.0

      t.timestamps
    end
  end
end
