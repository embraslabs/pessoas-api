Rails.application.routes.draw do
  defaults format: :json do
    root 'home#index'    

    controller :pessoas do
      get  '/pessoas',      action: :index,   as: :pessoas
      post '/pessoas',      action: :create,  as: false
      get  '/pessoas/:id',  action: :show,    as: :pessoa
    end

    # resources :pessoas, only: [:index, :show]
  end

  # Verbos:
  # GET, POST, PATCH, DELETE
end
