# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  concern :api_base do
    resources :mappings
    resources :roles
    resources :questions
  end

  namespace :api, constraints: { format: 'json' }  do
    namespace :v1 do
      concerns :api_base
    end
  end

end
