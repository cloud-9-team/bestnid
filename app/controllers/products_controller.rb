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

    # Crea un nuevo producto en blanco al entrar a la vista para publicar un nuevo producto
    # Éste servirá para caracterizar el formulario en la vista
    @product = Product.new
  end

  def create
    title = params[:product][:title]
    imgURL = params[:product][:imageURL]
    description = params[:product][:description]
    cat = params[:product][:category_id]

    c = params[:totalDays].to_i
    fecha_creado = Time.now
    fecha_fin = fecha_creado + c.days

    # A la variable anteriormente creada le asigno el nuevo producto
    @product = Product.create(title: title, description: description, imageURL: imgURL, category_id: cat,
                              visitCount: 0, user: current_user, created_at: fecha_creado, ends_at: fecha_fin)

    if @product.errors.any?
      @categories = Category.all
      flash.now[:alert] = view_context.generate_html_error(@product)
      render :new # Vuelvo a mostrar el formulario, esta vez cargado con los datos previamente completados
    else
      flash[:notice] = "Producto publicado."
      redirect_to sales_index_path
    end
    
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    flash[:notice] = "Producto eliminado."
    redirect_to welcome_index_path
  end
end