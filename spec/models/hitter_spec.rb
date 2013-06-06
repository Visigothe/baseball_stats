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
    end

    it { should be_valid }
  end

  describe '#parse_xml' do

    it { Hitter.should respond_to(:parse_xml) }

    it 'creates a new instance of HitterParser'

    it 'destroys all previous hitter records' do
      hitter = create(:hitter)
      another_hitter = build(:hitter)
      HitterParser.stub(:hitter).and_return(another_hitter)
      Hitter.parse_xml
      expect(Hitter.count).to eq 1
    end

    it 'creates a database entry from records yielded by HitterParser' do
      hitter = build(:hitter)
      HitterParser.stub(:hitter).and_return(hitter)
      expect(Hitter.parse_xml).to be_true
    end
  end
end