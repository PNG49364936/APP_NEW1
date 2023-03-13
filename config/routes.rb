Rails.application.routes.draw do
  root to: "menus#home"
        resources :menus do
          #get 'answer', to: 'menus#answer', as:'answer'
        resources :receipts, only: [:new, :create, :edit]
        member do
          post 'print', to: 'menus#print'
          get 'print', to: 'menus#print', format: :js
        end
        #get 'print', to: 'menus#print', as: 'print_menu'
  
  end
          resources :receipts, only:[:show]
          #get 'answer', to: 'apis#answer', as:'answer'
          get 'answer', to: 'menus#answer', as: 'menus_answer'
end
