class BidsController < ApplicationController

  before_action :authenticate_user!, only: [:index,:new,:destroy]

  def index
    @bids = Bid.where(user_id: current_user.id)
    @cant = @bids.count
  end

  def show
  end

  def edit
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
