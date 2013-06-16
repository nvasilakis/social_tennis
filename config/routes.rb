SocialTennis::Application.routes.draw do
  root to: 'static_pages#home'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
