class HomeController < ApplicationController
  def index
    @destaques = [
    Produto.find_by(categoria: "feminino"),
    Produto.find_by(categoria: "masculino"),
    Produto.find_by(categoria: "kids")
  ].compact
  end
end