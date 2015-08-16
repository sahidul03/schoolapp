Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products


  resources :users
  resources :admins
  resources :students do
    collection do
       get 'search_student'
       get 'admission'
       get 'admission_student_search'
       get "admission_confirm/:id", action: 'admission_confirm', as: :admission_confirm
    end
  end
  resources :teachers
  resources :committees
  resources :galleries do
    resources :photos
  end
  resources :videos
  resources :notices
  resources :events
  resources :results
  resources :routines
  resources :speeches
  resources :index_sliders
  resources :useful_links

  resources :schools do
    collection do
      get 'teachers'
      get "teacher_profile/:id", action: 'teacher_profile', as: :teacher_profile
      get 'committees'
      get "committee_profile/:id", action: 'committee_profile', as: :committee_profile
      get 'students'
      get "student_profile/:id", action: 'student_profile', as: :student_profile
      get 'notices'
      get "notice_details/:id", action: 'notice_details', as: :notice_details
      get 'events'
      get "event_details/:id", action: 'event_details', as: :event_details
      get "useful_links"
      get "routine"
      get "video_gallery"
      get "photo_galleries"
      get "photo_gallery/:id", action: 'photo_gallery', as: :photo_gallery
      get "search_student"
      get "results"
      get "result_details/:id", action: "result_details", as: :result_details
      get "academic_speeches"
      get "academic_speech/:id", action: "academic_speech", as: :academic_speech
      get "admission"
      post "admission_save"
      get "principal"
      get "chairman"
      get "contact_us"
      post "contact_save"


    end
  end

  resources :contacts

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
