# frozen_string_literal: true

Rails.application.routes.draw do
  post 'authenticate', to: 'authentications#authenticate'
  resources :doctors, only: %i[index show] do
    member do
      post 'like', to: 'doctor_likes#create'
      delete 'dislike', to: 'doctor_likes#destroy'
    end
  end
  resources :specialities, only: [:index]

  resources :specialities do
    resources :doctors, only: %i[index show]
  end

  resources :patients, only: [:create]
  resources :appointments, only: %i[index create destroy]
end
