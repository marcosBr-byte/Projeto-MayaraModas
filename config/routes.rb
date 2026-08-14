Rails.application.routes.draw do
  root "home#index"
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  #usuario
  get "user/login", to: "user#login"
  post "user/login", to: "user#create_login"
  get "user/logout", to: "user#logout", as: :logout

  get "user/loginAdmin", to: "user#loginAdmin"
  post "user/loginAdmin", to: "user#create_loginAdmin"

  get "user/cadastrar", to: "user#cadastrar"
  post "user/cadastrar", to: "user#create_cadastrar"

  get "user/cadastrarAdmin", to: "user#cadastrarAdmin"
  post "user/cadastrarAdmin", to: "user#create_cadastrarAdmin"
  get "user/:id", to: "user#show", as: :user
    
  # carrinho
  get "carrinho", to: "carrinho#index"
 
  # produtos
  get "produto/index", to: "produto#index"
  get "produto/novidades", to: "produto#novidades", as: :novidades_produtos
  # masculino
  get "produto/masculino",to: "produto#masculino",as: :masculino_produtos
  get "produto/masculino/:id",to: "produto#show",as: :masculino_produto
  post "produto/masculino",to: "produto#buscar_masculino"

  # feminino
  get "produto/feminino",to: "produto#feminino",as: :feminino_produtos
  get "produto/feminino/:id",to: "produto#show",as: :feminino_produto
  post "produto/feminino",to: "produto#buscar_feminino"
 
  # kids
  get "produto/kids",to: "produto#kids",as: :kids_produtos
  get "produto/kids/:id",to: "produto#show",as: :kids_produto
  post "produto/kids",to: "produto#buscar_kids"
  
  # cadastrar produto
  get "produto/new",to: "produto#new",as: :new_produto
  post "produto",to: "produto#create"

  # editiar produto
  get "produto/:id/edit",to: "produto#edit", as: :edit_produto

  # atulizar produto
  patch "produto/:id", to: "produto#update", as: :produto_update
  put "produto/:id", to: "produto#update"

  get "produto/:id", to: "produto#show", as: :show_produto
  delete "produto/:id", to: "produto#destroy", as: :delete_produto
end