#encoding: UTF-8
class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new,:create,:update,:destroy]
  before_action :product_context, only: [:show, :update]

  def index
  end

  def show

    if (current_user != @owner and not current_user.admin) and (@product.finished? or @product.timeout?)
      flash[:alert] = "No tienes autorización para ver este producto."
      redirect_to welcome_index_path
      return;
    end

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
    if c < 15 or c > 30
      @categories = Category.all
      flash.now[:alert] = "La cantidad de días de la subasta está fuera de rango"
      render :new # Vuelvo a mostrar el formulario, esta vez cargado con los datos previamente completados
      return
    end

    fecha_creado = Time.now
    fecha_fin = fecha_creado + c.days

    # A la variable anteriormente creada le asigno el nuevo producto
    @product = Product.create(title: title, description: description, imageURL: imgURL, category_id: cat, user: current_user, created_at: fecha_creado, ends_at: fecha_fin)

    if @product.errors.any?
      @categories = Category.all
      flash.now[:alert] = view_context.generate_html_error(@product)
      render :new # Vuelvo a mostrar el formulario, esta vez cargado con los datos previamente completados
    else
      flash[:notice] = "Producto publicado."
      redirect_to sales_index_path
    end
  end

  def update
    @temp = false
    
    if params[:product].blank? or params[:product][:chosen_bid_id].blank?
      flash.now[:alert] = "No se ha elegido ninguna oferta."
      render :show
      return false
    end

    bid_id = params[:product][:chosen_bid_id].to_i
    chosen_bid =  Bid.find(bid_id)
    
    if @product.timeout? and not @product.finished? and current_user == @owner and chosen_bid.present? and chosen_bid.product == @product
      @product.chosen_bid = chosen_bid
      @product.finished_at = Time.now
      @product.save

      if @product.errors.any?
        flash.now[:alert] = view_context.generate_html_error(@product)
        render :show
      else
        UserMailer.bid_accepted_seller_email(chosen_bid).deliver
        UserMailer.bid_accepted_buyer_email(chosen_bid).deliver
        render :bid_finished
      end
    else
      html = <<-HTML
      <div id="error_explanation">
        <h4>Error al actualizar la oferta ganadora del producto. Se puede deber a:</h4>
        <ul>
          <li>El usuario que esta actualizando la oferta no es creador de la subasta</li>
          <li>La oferta considerada como ganadora no existe</li>
          <li>La oferta considerada como ganadora en realidad corresponde a otro producto</li>
          <li>Todavía no terminó el tiempo para hacer subastas</li>
          <li>Ya se ha elegido una oferta ganadora</li>
        </ul>
      </div>
      HTML
      flash.now[:alert] = html.html_safe
      render :update
    end

    
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    flash[:notice] = "Producto eliminado."
    redirect_to welcome_index_path
  end

  private

  def product_context
    @product = Product.find(params[:id])
    @owner = @product.user
    @category = @product.category
  end
end