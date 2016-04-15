Rails.application.routes.draw do
  root 'liqpay_requests#index'

  resources :liqpay_requests, only: [:index, :new, :create, :show]
  post '/liqpay_payment', to: 'liqpay_requests#liqpay_payment'
end
