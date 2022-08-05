Rails.application.routes.draw do
  # namespace :publics do
  # end
  devise_for :admins,controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :end_users, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
  }

  scope module: :publics do
    get 'end_users/mypage' => 'end_users#show'
    get 'end_users/information/edit' => 'end_users#edit'
    patch 'end_users/infomation' => 'end_users#update'
    root 'homes#top'
    resources :groups, only: [:new,:index,:show,:edit,:create]
    # create 'customers/customers/infomation' => 'customers#update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
