class WelcomeController < ApplicationController
  def index
  	if params[:search]
  		@products = Product.search(params[:search])
  	else
  		@products = Product.all
  	end
  end
end
