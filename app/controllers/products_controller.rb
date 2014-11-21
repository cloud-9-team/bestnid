class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new,:form,:destroy]

  def index
  end

  def show
    @product = Product.find(params[:id])
    id = @product.user_id
    @owner = User.find(id)
    @category = @product.category
    if (@product.bids.where(user: current_user).count == 1)
      @temp = true
    else
      @temp = false
    end
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
    c = params[:totalDays].to_i
    cat = Category.where(id: params[:category]).first
    fecha_creado = Time.now
    fecha_fin = fecha_creado + c.days
    Product.create(title:t,description:d,imageURL:i,category:cat,visitCount: 0,user:current_user,created_at: fecha_creado, ends_at: fecha_fin)
    flash[:notice] = "Producto publicado."
    redirect_to sales_index_path
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    flash[:notice] = "Producto eliminado."
    redirect_to welcome_index_path
  end
end