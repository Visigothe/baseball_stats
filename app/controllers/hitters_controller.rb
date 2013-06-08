class HittersController < ApplicationController

  def index
    @best_avg = Hitter.order('avg DESC')

    respond_to do |format|
      format.html
    end
  end
end