Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
