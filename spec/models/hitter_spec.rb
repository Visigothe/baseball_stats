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
      it { should_not allow_mass_assignment_of(attribute.to_sym) }
    end

    it { should be_valid }
  end

  it { Hitter.should respond_to(:parse_xml) }

  it '#parse_xml(url) destroys all previous hitter records' do
    5.times { create(:hitter) }
    xml = open('spec/support/statistics_no_player.xml')
    Hitter.parse_xml(xml)
    expect(Hitter.count).to eq 0
  end

  describe "#parse_xml(url) uses HitterParser to parse data and" do

    let(:xml) { open('spec/support/statistics_all_positions.xml') }

    before(:all) { Hitter.parse_xml(xml) }

    it 'create records for Catcher' do
      xml = open('spec/support/statistics_catcher.xml')
      Hitter.parse_xml(xml)
      expect(Hitter.count).to eq 1
    end
    it 'create records for Frist Base' do
      xml = open('spec/support/statistics_first_base.xml')
      Hitter.parse_xml(xml)
      expect(Hitter.count).to eq 1
    end

    it 'create records for Second Base' do
      xml = open('spec/support/statistics_second_base.xml')
      Hitter.parse_xml(xml)
      expect(Hitter.count).to eq 1
    end

    it 'create records for Third Base' do
      xml = open('spec/support/statistics_third_base.xml')
      Hitter.parse_xml(xml)
      expect(Hitter.count).to eq 1
    end

    it 'create records for Outfield' do
      xml = open('spec/support/statistics_outfield.xml')
      Hitter.parse_xml(xml)
      expect(Hitter.count).to eq 1
    end

    it 'does not create records for Starting Pitcher' do
      xml = open('spec/support/statistics_starting_pitcher.xml')
      Hitter.parse_xml(xml)
      expect(Hitter.count).to eq 0
    end

    it 'does not create records for Relief Pitcher' do
      xml = open('spec/support/statistics_relief_pitcher.xml')
      Hitter.parse_xml(xml)
      expect(Hitter.count).to eq 0
    end
  end
end
