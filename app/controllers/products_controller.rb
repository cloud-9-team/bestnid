class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    id = @product.user_id
    @owner = User.find(id)
  end

  def edit
  end

  def new
  end

  def destroy
  end
end
