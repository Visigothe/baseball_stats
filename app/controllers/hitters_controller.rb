class HittersController < ApplicationController

  def index
    @best_avg = Hitter.order('avg DESC').limit(25)

    respond_to do |format|
      format.html
    end
  end
end