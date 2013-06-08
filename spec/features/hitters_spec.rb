require 'spec_helper'

describe 'Hitters' do

  before do
    25.times { create(:hitter) }
    visit root_path
  end

  subject { page }

  it { should have_selector('.navbar.navbar-fixed-top') }

  it { should have_selector('.navbar-inner') }

  it 'has a container inside .navbar-inner' do
    within('.navbar-inner') do
      should have_selector('.container#navbar')
    end
  end

  it 'has a brand' do
    within('.container#navbar') do
      should have_link('Hitter Statistics')
      should have_selector('.brand', text: 'Hitter Statistics')
    end
  end

  it { should have_selector('table.table.table-striped.table-bordered') }

  it 'has a thead and tbody' do
    within('table.table.table-striped.table-bordered') do
      should have_selector('thead')
      should have_selector('tbody')
    end
  end

  it 'has the right column headers' do
    within('thead') do
      [
        'Year', 'Name', 'City', 'Team', 'AVG', 
        'Home Runs', 'RBI', 'Runs', 'Steals', 'OPS'
      ].each do |attribute|
        should have_selector('th', text: attribute)
      end
    end
  end

  describe 'table rows' do

    let(:hitters) { Hitter.order('avg DESC') }

    it 'have the right ids' do
      # 25 players total in the table (Best or Worst)
      within('tbody') do
        hitters.each do |hitter|
          should have_selector("tr#hitter_#{hitter.id}")
        end
      end
    end

    it 'have the right ids for data columns' do
      # 25 players total in the table (Best or Worst)
      hitters.each do |hitter|
        within("tr#hitter_#{hitter.id}") do
          %w(year name city team avg hr rbi runs sb ops).each do |attribute|
            should have_selector("td#hitter_#{hitter.id}_#{attribute}")
          end
        end
      end
    end
  end

  describe 'table data' do

    let(:hitter) { Hitter.first }

    it { should have_selector("td#hitter_#{hitter.id}_year", text: hitter.year) }
    it { should have_selector("td#hitter_#{hitter.id}_name", text: hitter.full_name) }
    it { should have_selector("td#hitter_#{hitter.id}_city", text: hitter.team_city) }
    it { should have_selector("td#hitter_#{hitter.id}_team", text: hitter.team_name) }
    it { should have_selector("td#hitter_#{hitter.id}_avg", text: hitter.avg) }
    it { should have_selector("td#hitter_#{hitter.id}_hr", text: hitter.home_runs) }
    it { should have_selector("td#hitter_#{hitter.id}_rbi", text: hitter.rbi) }
    it { should have_selector("td#hitter_#{hitter.id}_runs", text: hitter.runs) }
    it { should have_selector("td#hitter_#{hitter.id}_sb", text: hitter.steals) }
    it { should have_selector("td#hitter_#{hitter.id}_ops", text: hitter.ops) }
  end
end