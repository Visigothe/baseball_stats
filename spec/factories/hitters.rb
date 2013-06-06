FactoryGirl.define do

  factory :hitter do
    # Basic attributes for a hitter
    year 1998
    sequence(:league_name)    { |n| n%2 == 0 ? 'National League' : 'American League' }
    sequence(:division_name)  { |n| n%3 == 0 ? 'East' : (n%3 == 1 ? 'Central' : 'West') }
    sequence(:team_city)      { |n| "City #{n}" }
    sequence(:team_name)      { |n| "Team #{n}" }
    sequence(:given_name)     { |n| "Player #{n}" }
    sequence(:surname)        { |n| "Hitter #{n}" }
    position                  'Catcher'

    # Unmodified stats not used in calculations
    steals                    0
    rbi                       1
    runs                      3

    # Stats needed for calculations
    at_bats                   28
    hits                      5
    doubles                   1
    triples                   0
    home_runs                 1
    walks                     2
    hit_by_pitch              0
    sacrifice_flies           0

    # Calculated stats
    avg                       nil
    obp                       nil
    slg                       nil
    ops                       nil

    # These stats are not needed for the scope of this project
    caught_stealing           nil
    fielding_errors           nil
    games                     nil
    games_started             nil
    pb                        nil
    sacrifice_hits            nil
    struck_out                nil
  end
end
