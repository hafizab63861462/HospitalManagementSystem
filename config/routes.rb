Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords: 'users/passwords',
        registrations: 'users/registrations',
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'

  get 'hospitals/:hospital_id/treatments/:id/:uid/assign', to: "treatments#assignHospitalAndTreatmentToDoctor", as: 'assignDoctor'
  get 'showerror' , to: "error#show"
  

  resources :requests
  resources :users
  
  resources :hospitals do 
    resources :treatments
  end

end
