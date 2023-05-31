class ListsController < ApplicationController
  def index
    @lists = Product.all
  end
end
