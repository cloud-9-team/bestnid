class BidsController < ApplicationController

  before_action :authenticate_user!, only: [:index,:new,:destroy]

  def index
    @bids = Bid.where(user_id: current_user.id)
  end

  def show
    
  end

  def edit
    bid = Bid.find(params[:bid][:id])
    bid.value = params[:bid][:value]
    bid.save
    flash[:notice]= "Su oferta fue modificada correctamente."
    redirect_to(bids_path)
  end

  def new
    @product = Product.find(params[:product_id_param])
    bid = @product.bids.new
    bid.need = params[:need]
    bid.value = params[:value]
    bid.user_id = current_user.id
    bid.save
    if bid.errors.any?
      @bids = Bid.where(user_id: current_user.id)
      flash.now[:alert] = view_context.generate_html_error(bid)
      render :index
    else
      flash[:notice] = "Su oferta fue cargada correctamente."
      redirect_to bids_path
    end
  end

  def create

  end

  def destroy

  end
end
