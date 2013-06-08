require 'spec_helper'

describe Hitter do

  describe 'attributes' do
    subject { build(:hitter) }

    %w(year league_name division_name team_city team_name surname given_name 
       position games games_started at_bats runs hits doubles triples home_runs 
       rbi steals caught_stealing sacrifice_hits sacrifice_flies fielding_errors 
       pb walks struck_out hit_by_pitch avg ops
      ).each do |attribute|
      it { should have_db_column(attribute.to_sym) }
      it { should allow_mass_assignment_of(attribute.to_sym) }
    end

    it { should be_valid }
  end

  it { Hitter.should respond_to(:parse_xml) }

  specify '#parse_xml destroys all previous hitter records' do
    5.times { create(:hitter) }
    source = open('spec/support/statistics_1_player.xml')
    Hitter.parse_xml(source)
    expect(Hitter.count).to eq 1
  end

  describe "#parse_xml uses HitterParser to parse data and" do

    let(:source) { open('spec/support/statistics_all_positions.xml') }

    before(:all) { Hitter.parse_xml(source) }

    it 'create records for Catcher' do
      catchers = Hitter.find_all_by_position('Catcher')
      expect(catchers.count).to eq 1
    end
    it 'create records for Frist Base' do
      first_base_men = Hitter.find_all_by_position('First Base')
      expect(first_base_men.count).to eq 1
    end

    it 'create records for Second Base' do
      second_base_men = Hitter.find_all_by_position('Second Base')
      expect(second_base_men.count).to eq 1
    end

    it 'creates records for Shortstop' do
      shortstops = Hitter.find_all_by_position('Shortstop')
      expect(shortstops.count).to eq 1
    end

    it 'create records for Third Base' do
      third_base_men = Hitter.find_all_by_position('Third Base')
      expect(third_base_men.count).to eq 1
    end

    it 'create records for Outfield' do
      outfielders = Hitter.find_all_by_position('Outfield')
      expect(outfielders.count).to eq 1
    end

    it 'does not create records for Starting Pitcher' do
      starting_pitchers = Hitter.find_all_by_position('Starting Pitcher')
      expect(starting_pitchers.count).to eq 0
    end

    it 'does not create records for Relief Pitcher' do
      relief_pitchers = Hitter.find_all_by_position('Relief Pitcher')
      expect(relief_pitchers.count).to eq 0
    end
  end
end
