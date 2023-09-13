# frozen_string_literal: true

Rails.application.routes.draw do
  root 'projects#new'

  resources :projects, except: :show do
    resources :tasks, only: %i[index new]
    resources :gantt_chart, only: :index
  end

  scope '/api/:project_id' do
    get '/data', to: 'gantt_chart#data'

    post '/task', to: 'tasks#add'
    put '/task/:id', to: 'tasks#update'
    delete '/task/:id', to: 'tasks#delete'

    post '/link', to: 'link#add'
    put '/link/:id', to: 'link#update'
    delete '/link/:id', to: 'link#delete'
  end

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
end
