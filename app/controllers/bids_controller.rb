class BidsController < ApplicationController

  before_action :authenticate_user!, only: [:index,:new,:destroy]

  def index
    @bids = Bid.where(user_id: current_user.id)
  end

  def show
    
  end

  def edit
    @product = Product.find(params[:product_id_param])
    bid = @product.bids.where(user: current_user).first
    bid.value = params[:value]
    bid.need = params[:need]
    bid.save
    flash[:notice]="Su oferta fue modificada correctamente."
    redirect_to(bids_path)
  end

  def new
    @product = Product.find(params[:product_id_param])
    bid = @product.bids.new
    bid.need = params[:need]
    bid.value = params[:value]
    bid.user_id = current_user.id
    bid.save
    flash[:notice]="Su oferta fue cargada correctamente."
    redirect_to(bids_path)
  end

  def create

  end

  def destroy

  end
end
