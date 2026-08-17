class CarrinhoController < ApplicationController
  before_action :requer_login
  before_action :buscar_ou_criar_carrinho

  def index
    @itens = @carrinho.itemcarrinhos.includes(:produto)
  end

  def finalizar
    redirect_to carrinho_path, notice: "Funcionalidade de finalizar compra em breve!"
  end

  def adicionar
    produto = Produto.find(params[:produto_id])
    item = @carrinho.itemcarrinhos.find_by(produto_id: produto.id)

    if item
      item.update(quantidade: item.quantidade + 1)
    else
      @carrinho.itemcarrinhos.create(produto_id: produto.id, quantidade: 1)
    end

    atualizar_total
    redirect_to carrinho_path, notice: "Produto adicionado ao carrinho."
  end

  def limpar
    @carrinho.itemcarrinhos.destroy_all
    atualizar_total
    redirect_to carrinho_path, notice: "Carrinho esvaziado."
  end

  private

  def buscar_ou_criar_carrinho
    @carrinho = Carrinho.find_or_create_by(user_id: usuario_atual.id)
  end

  def atualizar_total
    total = @carrinho.itemcarrinhos.includes(:produto).sum { |item| item.quantidade * item.produto.preco }
    @carrinho.update(total: total)
  end
end 