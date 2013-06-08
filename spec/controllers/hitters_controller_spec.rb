require 'spec_helper'

describe HittersController do

  describe 'GET #index' do

    it 'renders the index view' do
      get :index
      expect(response).to render_template('hitters/index')
    end

    # it 'populates an array of hitters' do
    #   hitter = create(:hitter)
    #   get :index
    #   expect(assigns(:hitters)).to eq [hitter]
    # end

    describe 'populates an array of hitters sorted by avg' do

      let(:worst) { create(:hitter, avg: 0.111) }
      let(:best) { create(:hitter, avg: 0.999) }
      let(:average) { create(:hitter, avg: 0.555) }
      
      specify 'desc' do
        get :index
        expect(assigns(:best_avg)).to eq [best, average, worst]
      end
    end
  end
end