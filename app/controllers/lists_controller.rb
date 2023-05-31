class ListsController < ApplicationController
  def index
    @lists = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @game = Game.find(@product.game_id)
  end
end
