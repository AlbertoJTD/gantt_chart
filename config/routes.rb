# frozen_string_literal: true

Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :tasks do
      # resources :taskdependencies, only: %i[create update destroy edit]
    end
  end
end
