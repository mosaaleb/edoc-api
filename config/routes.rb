# frozen_string_literal: true

Rails.application.routes.draw do
  post 'authenticate', to: 'authentications#authenticate'
  resources :accounts, only: [:create]
  resources :doctors, only: %i[index show]
  resources :specialities, only: [:index]
end
