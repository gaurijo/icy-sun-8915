Rails.application.routes.draw do
  get '/departments', to: 'departments#index'
  get '/employees/:id', to: 'employees#show'
  post '/ticket_employees/new', to: 'ticket_employees#create'
end
