require 'open-uri'
require 'nokogiri'

class HitterParser

  def initialize(source)
    # 'http://www.cafeconleche.org/examples/baseball/1998statistics.xml'
    @source = source
    @data = Nokogiri::HTML(@source)
  end

  def hitters
    record = {}
    seasons = @data.xpath('//season') # Array of seasons in the data
    seasons.each do |season|
      parse_season(season, record)
    end
  end

  def parse_season(season, record)
    record[:year] = season.at_xpath('year').text # Set the season year
    leagues = season.xpath('.//league') # Array of leagues in the season
    leagues.each do |league|
      parse_league(league, record)
    end
  end

  def parse_league(league, record)
    record[:league_name] = league.at_xpath('league_name').text # Set the league name
    divisions = league.xpath('.//division') # Array of divisions within league
    divisions.each do |division|
      parse_division(division, record)
    end
  end

  def parse_division(division, record)
    record[:division_name] = division.at_xpath('division_name').text # Set the division name
    teams = division.xpath('.//team') # Array of teams in the division
    teams.each do |team|
      parse_team(team, record)
    end
  end

  def parse_team(team, record)
    record[:team_name] = team.at_xpath('team_name').text # Set the team name
    record[:team_city] = team.at_xpath('team_city').text # Set the team city
    players = team.xpath('.//player') # Array of players on the team 
    players.each do |player|
      parse_player(player, record)
    end
  end

  def parse_player(player, record)
    unless player.at_xpath('position').text.eql?('Relief Pitcher')
      unless player.at_xpath('position').text.eql?('Starting Pitcher')
        player_base(player, record)
        player_stats(player, record)
        record[:avg] = calculate_avg(record) # Calculate and set avg
        record[:obp] = calculate_obp(record) # Calculate and set obp
        record[:slg] = calculate_slg(record) # Calculate and set slg
        record[:ops] = calculate_ops(record) # Calculate and set ops
        Hitter.create_hitter_from_record(record)
      end
    end
  end

  def player_base(player, record)
    %w(position surname given_name).each do |attribute|
      record[attribute.to_sym] = player.at_xpath(attribute).text # Set player attributes (string)
    end
  end

  def player_stats(player, record)
    %w(
       games games_started at_bats runs hits doubles triples home_runs rbi steals
       caught_stealing sacrifice_hits sacrifice_flies pb walks struck_out hit_by_pitch
    ).each do |stat|
      record[stat.to_sym] = player.at_xpath(stat).text.to_i # Set player stat (integers)
    end
    record[:fielding_errors] = player.at_xpath('errors').text.to_i # Set errors
  end

  def calculate_avg(record)
    total_hits = record[:hits] + record[:doubles] + record[:triples] + record[:home_runs]
    avg = record[:at_bats] == 0 ? 0 : (total_hits.to_f/record[:at_bats]).round(3)
  end

  def calculate_obp(record)
    total_hits = record[:hits] + record[:doubles] + record[:triples] + record[:home_runs]
    actual = total_hits + record[:walks] + record[:hit_by_pitch]
    opportunities = record[:at_bats] + record[:walks] + record[:hit_by_pitch] + record[:sacrifice_flies]
    obp = opportunities == 0 ? 0 : (actual.to_f/opportunities).round(3)
  end

  def calculate_slg(record)
    slugging = record[:hits] + 2*record[:doubles] + 3*record[:triples] + 4*record[:home_runs]
    slg = record[:at_bats] == 0 ? 0 : (slugging.to_f/record[:at_bats]).round(3)
  end

  def calculate_ops(record)
    ops = (record[:obp] + record[:slg]).round(3)
  end
end
