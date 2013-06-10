BaseballStats::Application.routes.draw do

  root to: 'hitters#index'

  resources :hitters, only: [:index] do
    collection do
      get :avg_desc
      get :avg_asc
      get :hr_desc
      get :hr_asc
      get :rbi_desc
      get :rbi_asc
      get :runs_desc
      get :runs_asc
      get :sb_desc
      get :sb_asc
      get :ops_desc
      get :ops_asc
    end
  end
end
