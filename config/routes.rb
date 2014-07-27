DroidconPoland::Application.routes.draw do
  LOCALE_PATTERN = /[a-z]{2}((-|_)[a-zA-Z]{2})?/

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: 'home#index'
  get '/:locale', constraints: { locale: LOCALE_PATTERN  }, to: 'home#index'

  scope "/:locale", constraints: { locale: LOCALE_PATTERN  } do
    namespace :api do
      namespace :v1 do
        resources :speakers, only: [:index]
        resources :schedules, only: [:index] do
          collection do
            get :extra
          end
        end
        resources :rooms, only: [:index]
      end
    end
  end
end
