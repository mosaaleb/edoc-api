# frozen_string_literal: true

Rails.application.routes.draw do
  get 'appointments/create'
  post 'authenticate', to: 'authentications#authenticate'
  resources :accounts, only: [:create]
  resources :doctors, only: %i[index show]
  resources :specialities, only: [:index]

  resources :specialities do
    resources :doctors, only: [:index]
  end

  resources :appointments, only: [:create]
end
