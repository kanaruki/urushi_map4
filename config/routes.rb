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
    resources :places, only: [:create,:destroy,:show,:edit,:update,:delete]
    patch 'end_users/withdrawal' =>'end_users#withdrawal'
    get 'end_users/mypage' => 'end_users#show'
    get 'end_users/information/edit' => 'end_users#edit'
    patch 'end_users/infomation' => 'end_users#update'
    root 'homes#top'
    resources :groups, only: [:new,:index,:show,:edit,:create]
    post 'groups/add_user' => 'groups#add_user'
    # create 'customers/customers/infomation' => 'customers#update'
  end

   namespace :admins do
     resources :end_users, only: [:index,:show,:edit,:update]
     resources :groups, only: [:index,:show]
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
