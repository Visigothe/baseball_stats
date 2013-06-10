require 'spec_helper'

describe HittersController do

  let(:worst) { create(:hitter, avg: 0.111, home_runs: 1, rbi: 1, runs: 1, steals: 1, ops: 0.125) }
  let(:best) { create(:hitter, avg: 0.999, home_runs: 9, rbi: 9, runs: 9, steals: 9, ops: 0.925) }
  let(:average) { create(:hitter, avg: 0.555, home_runs: 5, rbi: 5, runs: 5, steals: 5, ops: 0.525) }

  describe 'GET #index' do

    before { get :index }

    it 'renders the index view' do
      expect(response).to render_template('hitters/index')
    end

    it 'populates an array of hitters sorted by avg DESC' do
      expect(assigns(:hitters)).to eq [best, average, worst]
    end
  end
end