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
    @product = current_user.products.find(params[:id])
    @product.destroy
    flash[:notice] = "Produto eliminado."
    redirect_to welcome_index_path
  end
end
