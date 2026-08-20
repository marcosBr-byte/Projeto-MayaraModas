Rails.application.routes.draw do
  root "home#index"
  
  get "up" => "rails/health#show", as: :rails_health_check
  
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
    
  get "carrinho", to: "carrinho#index"
  post "carrinho/adicionar/:produto_id", to: "carrinho#adicionar", as: :adicionar_carrinho
  post "carrinho/finalizar", to: "carrinho#finalizar", as: :finalizar_carrinho
  delete "carrinho/limpar", to: "carrinho#limpar", as: :limpar_carrinho
  patch "itemcarrinho/:id", to: "itemcarrinho#atualizar", as: :atualizar_itemcarrinho
  delete "itemcarrinho/:id", to: "itemcarrinho#remover", as: :remover_itemcarrinho
 
  get "produto/index", to: "produto#index"
  get "produto/novidades", to: "produto#novidades", as: :novidades_produtos
  get "produto/new", to: "produto#new", as: :new_produto
  post "produto/new", to: "produto#create"

  get "produto/masculino", to: "produto#masculino", as: :masculino_produtos
  get "produto/masculino/:id", to: "produto#show", as: :masculino_produto
  post "produto/masculino", to: "produto#buscar_masculino"

  get "produto/feminino", to: "produto#feminino", as: :feminino_produtos
  get "produto/feminino/:id", to: "produto#show", as: :feminino_produto
  post "produto/feminino", to: "produto#buscar_feminino"

  get "produto/kids", to: "produto#kids", as: :kids_produtos
  get "produto/kids/:id", to: "produto#show", as: :kids_produto
  post "produto/kids", to: "produto#buscar_kids"

  get "produto/:id/edit", to: "produto#edit", as: :edit_produto
  patch "produto/:id", to: "produto#update", as: :produto_update
  put "produto/:id", to: "produto#update"
  get "produto/:id", to: "produto#show", as: :show_produto
  delete "produto/:id", to: "produto#destroy", as: :delete_produto
end