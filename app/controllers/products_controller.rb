class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new,:form,:destroy]

  def index
  end

  def show
    @product = Product.find(params[:id])
    id = @product.user_id
    @owner = User.find(id)
    cat = @product.category_id
    @category = Category.find(cat)
  end

  def edit
  end

  def new    
  end

  def form
    t = params[:title]
    i = params[:imageURL]
    d = params[:description]
    c = params[:totalDays]
    u = current_user.id
    Product.create(title:t,description:d,imageURL:i,totalDays:c,visitCount: 0,user:u,finished: false)
    redirect_to welcome_index_path
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    flash[:notice] = "Produto eliminado."
    redirect_to welcome_index_path
  end
end