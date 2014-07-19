DroidconPoland::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  get '/:locale' => 'pages#index'

  root to: 'pages#index'

  resource :api, only: [] do
    get :speakers
    get :schedules
    get :rooms
  end

  scope "/:locale" do
  end
end
