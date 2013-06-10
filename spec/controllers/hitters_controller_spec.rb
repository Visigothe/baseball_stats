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

  describe 'GET' do # Batting Average

    context '#avg_desc' do

      before { get :avg_desc }

      it 'renders the index view' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by avg DESC' do
        expect(assigns(:hitters)).to eq [best, average, worst]
      end
    end

    context '#avg_asc' do

      before { get :avg_asc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by avg ASC' do
        expect(assigns(:hitters)).to eq [worst, average, best]
      end
    end
  end

  describe 'GET' do # Home Runs

    context '#hr_desc' do
      before { get :hr_desc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by home_runs DESC' do
        expect(assigns(:hitters)).to eq [best, average, worst]
      end
    end

    context '#hr_asc' do
      before { get :hr_asc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by home_runs ASC' do
        expect(assigns(:hitters)).to eq [worst, average, best]
      end
    end
  end

  describe 'GET' do # RBI

    context '#rbi_desc' do
      before { get :rbi_desc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by rbi DESC' do
        expect(assigns(:hitters)).to eq [best, average, worst]
      end
    end

    context '#rbi_asc' do
      before { get :rbi_asc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by rbi ASC' do
        expect(assigns(:hitters)).to eq [worst, average, best]
      end
    end
  end

  describe 'GET' do # Runs

    context '#runs_desc' do
      before { get :runs_desc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by runs DESC' do
        expect(assigns(:hitters)).to eq [best, average, worst]
      end
    end

    context '#runs_asc' do
      before { get :runs_asc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by runs ASC' do
        expect(assigns(:hitters)).to eq [worst, average, best]
      end
    end
  end

  describe 'GET' do # Steals

    context '#sb_desc' do
      before { get :sb_desc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by steals DESC' do
        expect(assigns(:hitters)).to eq [best, average, worst]
      end
    end

    context '#sb_asc' do
      before { get :sb_asc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by steals ASC' do
        expect(assigns(:hitters)).to eq [worst, average, best]
      end
    end
  end

  describe 'GET' do # OPS

    context '#ops_desc' do
      before { get :ops_desc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by ops DESC' do
        expect(assigns(:hitters)).to eq [best, average, worst]
      end
    end

    context '#ops_asc' do
      before { get :ops_asc }

      it 'renders the table_body partial' do
        expect(response).to render_template('hitters/_table_body')
      end

      it 'populates an array of hitters sorted by ops ASC' do
        expect(assigns(:hitters)).to eq [worst, average, best]
      end
    end
  end
end