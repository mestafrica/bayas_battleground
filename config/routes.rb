Rails.application.routes.draw do
  resources :sessions, only:[:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  post 'quiz/store'

  root 'welcome#index'

  resources :users do
    member do
      get :confirm_email
    end
  end

  #This is a resource for Tests which contains a new restful collection method to get all test to show to the Test Taker
  #And also inside resource lies Questions which is a nested resource so all question resources rely on test resource
  #Within the question resource another Display method is instantiated
   resources :tests do
    collection do
        get :display
      end

    collection do
        post :submission
      end

      member do
        get :quiz
      end
    resources :questions
  end

  resources :questions do
    resources :options
  end

end
