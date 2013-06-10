class HittersController < ApplicationController

  # Default - 25 hitters with the best avg
  def index
    @hitters = Hitter.order('avg DESC').limit(25)

    respond_to do |format|
      format.html
    end
  end

  # 25 hitters with the worst avg
  def avg_desc
    @hitters = Hitter.order('avg DESC').limit(25)
    hitter_table_body(@hitters)
  end

  def avg_asc
    @hitters = Hitter.order('avg ASC').limit(25)
    hitter_table_body(@hitters)
  end

  # 25 hitters with the best home_runs
  def hr_desc
    @hitters = Hitter.order('home_runs DESC').limit(25)
    hitter_table_body(@hitters)
  end

  # 25 hitters with the worst home_runs
  def hr_asc
    @hitters = Hitter.order('home_runs ASC').limit(25)
    hitter_table_body(@hitters)  
  end

  # 25 hitters with the best rbi
  def rbi_desc
    @hitters = Hitter.order('rbi DESC').limit(25)
    hitter_table_body(@hitters)
  end

  # 25 hitters with the worst rbi
  def rbi_asc
    @hitters = Hitter.order('rbi ASC').limit(25)
    hitter_table_body(@hitters)
  end

  # 25 hitters with the best runs
  def runs_desc
    @hitters = Hitter.order('runs DESC').limit(25)
    hitter_table_body(@hitters)
  end

  # 25 hitters with the worst runs
  def runs_asc
    @hitters = Hitter.order('runs ASC').limit(25)
    hitter_table_body(@hitters)
  end

  # 25 hitters with the best steals
  def sb_desc
    @hitters = Hitter.order('steals DESC').limit(25)
    hitter_table_body(@hitters)
  end

  # 25 hitters with the worst steals
  def sb_asc
    @hitters = Hitter.order('steals ASC').limit(25)
    hitter_table_body(@hitters)
  end
  
  # 25 hitters with the best ops
  def ops_desc
    @hitters = Hitter.order('ops DESC').limit(25)
    hitter_table_body(@hitters)
  end

  # 25 hitters with the worst ops
  def ops_asc
    @hitters = Hitter.order('ops ASC').limit(25)
    hitter_table_body(@hitters)
  end

  def hitter_table_body(hitters)
    render partial: 'hitters/table_body', layout: false, locales: { hitters: hitters }
  end
end