DroidconPoland::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  get '/:locale' => 'home#index'

  root to: 'home#index'

  resource :api, only: [] do
    get :speakers
    get :schedules
    get :rooms
  end

  scope "/:locale" do
  end
end
