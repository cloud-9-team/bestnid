class SalesController < ApplicationController

before_action :authenticate_user!, only: [:index]

  def index
  	id = current_user.id
  	@products = Product.where(user_id: id)
  end
end
