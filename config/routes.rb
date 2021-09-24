Rails.application.routes.draw do
  # VERBO PATH CONTROLLER ACTION ALIAS
  # GET, POST, PATCH, DELETE
  defaults format: :json do
    get '/', controller: :home, action: :index, as: :root 
    
    get    '/pessoas',     controller: :people, action: :index,   as: :pessoas
    post   '/pessoas',     controller: :people, action: :create,  as: false
    get    '/pessoas/:id', controller: :people, action: :show,    as: :person
    patch  '/pessoas/:id', controller: :people, action: :update,  as: false
    delete '/pessoas/:id', controller: :people, action: :destroy, as: false
  end

end
