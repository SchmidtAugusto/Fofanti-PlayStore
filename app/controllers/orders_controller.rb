class OrdersController < ApplicationController
  before_action :set_order, only: %i[show destroy]

  def index
    @orders = Order.all
  end

  def show
    @game = Game.find(@order.product.game_id)
  end

  def create
    @order = Order.new(product_id: params[:product_id], user_id: current_user.id)

    if @order.save
      redirect_to orders_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end


  def order_params
    params.require(:order).permit(:product_id, :user_id)
  end
end
