class HittersController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    # Show 25 hitters at a time
    @hitters = Hitter.order(sort_column + ' ' + sort_direction).limit(25)
  end

  private

  def sort_column
    # Default is avg
    %w(avg home_runs rbi runs steals ops).include?(params[:sort]) ? params[:sort] : 'avg'
  end

  def sort_direction
    # Defaults is desc
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'desc'
  end
end