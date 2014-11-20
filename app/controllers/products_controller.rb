class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new,:form,:destroy]

  def index
  end

  def show
    @product = Product.find(params[:id])
    id = @product.user_id
    @owner = User.find(id)
    @category = @product.category
  end

  def edit
  end

  def new
    @categories = Category.all
  end

  def form
    t = params[:title]
    i = params[:imageURL]
    d = params[:description]
    c = params[:totalDays]
    cat = Category.where(id: params[:category]).first
    Product.create(title:t,description:d,imageURL:i,totalDays:c,category:cat,visitCount: 0,user:current_user,finished: false)
    flash[:notice] = "Produto publicado."
    redirect_to sales_index_path
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    flash[:notice] = "Produto eliminado."
    redirect_to welcome_index_path
  end
end