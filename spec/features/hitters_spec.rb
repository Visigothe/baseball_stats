require 'spec_helper'

describe 'Hitters' do

  before { visit root_path }

  subject { page }

  it { should have_selector('.navbar.navbar-fixed-top') }

  it { should have_selector('.navbar-inner') }

  it 'has a container inside .navbar-inner' do
    within('.navbar-inner') do
      subject.should have_selector('.container#navbar')
    end
  end

  it 'has a brand' do
    within('.container#navbar') do
      subject.should have_link('Hitter Statistics')
      subject.should have_selector('.brand', text: 'Hitter Statistics')
    end
  end

  it { should have_selector('table.table.table-striped.table-bordered') }

  it 'has a thead and tbody' do
    within('table.table.table-striped.table-bordered') do
      subject.should have_selector('thead')
      subject.should have_selector('tbody')
    end
  end

  it 'has the right column headers' do
    within('thead') do
      %w(YEAR NAME TEAM AVG HR RBI RUNS SB OPS).each do |attribute|
        subject.should have_selector('th', text: attribute)
      end
    end
  end

  it 'has the right rows' do
    within('tbody') do
      # 25 players total in the table (Best or Worst)
      for n in (1..25) do
        subject.should have_selector("tr#player_#{n}")
      end
    end
  end

  it 'has the right id for each data column in each row' do
    # 25 players total in the table (Best or Worst)
    for n in (1..25) do
      within("tr#player_#{n}") do
        %w(year name team avg hr rbi runs sb ops).each do |attribute|
          subject.should have_selector("td#player_#{n}_#{attribute}")
        end
      end
    end
  end



end