Rails.application.routes.draw do
  # VERBO PATH CONTROLLER ACTION ALIAS
  # GET, POST, PATCH, DELETE
  defaults format: :json do
    root to: 'home#index'
    
    controller :people do
      get    '/pessoas',     action: :index,   as: :pessoas
      post   '/pessoas',     action: :create,  as: false
      get    '/pessoas/:id', action: :show,    as: :person
      patch  '/pessoas/:id', action: :update,  as: false
      delete '/pessoas/:id', action: :destroy, as: false
    end

    controller :tickets do
      get '/tickets',     action: :index, as: :tickets
      get '/tickets/:id', action: :show,  as: :ticket
    end

  end

end
