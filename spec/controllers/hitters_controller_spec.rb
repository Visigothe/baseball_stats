require 'spec_helper'

describe HittersController do

  describe 'GET #index' do

    it 'renders the index view' do
      get :index
      expect(response).to render_template('hitters/index')
    end

    context 'assigns the 25 hitters with best' do
      specify 'avg to @best_avg'
      specify 'hr to @best_hr'
      specify 'rbi to @best_rbi'
      specify 'runs to @best_runs'
      specify 'sb to @best_sb'
      specify 'ops to @best_ops'
    end

    context 'assigns the 25 hitters with the worst' do
      specify 'avg to @worst_avg'
      specify 'hr to @worst_hr'
      specify 'rbi to @worst_rbi'
      specify 'runs to @worst_runs'
      specify 'sb to @worst_sb'
      specify 'ops to @worst_ops'
    end
  end
end