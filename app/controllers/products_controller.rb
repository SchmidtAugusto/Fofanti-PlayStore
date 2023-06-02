class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.all.order(id: :desc)
  end

  def show
    @game = Game.find(@product.game_id)
  end

  def new
    @product = Product.new
    @games = Game.all
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to lists_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
    @games = Game.all
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to list_path(@product), notice: 'Produto atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to lists_url, notice: "Product was successfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :game_id, :user_id, :photo)
  end
end
