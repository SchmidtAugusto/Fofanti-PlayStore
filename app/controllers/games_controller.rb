class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @game = Game.find(params[:id])
    @products = Product.where(game_id: @game.id)
  end
end
