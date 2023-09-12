# frozen_string_literal: true

Rails.application.routes.draw do
  root 'projects#new'

  resources :projects do
    resources :tasks do
      # resources :taskdependencies, only: %i[create update destroy edit]
    end
    resources :gantt_chart, only: :index
  end

  scope '/api' do
    get '/data/:project_id', to: 'gantt_chart#data'
  end 
end
