class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @products = Product.where(game_id: @game.id)
  end
end
