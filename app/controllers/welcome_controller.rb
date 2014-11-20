class WelcomeController < ApplicationController
  def index
	if params[:search]
		@products = Product.search(params[:search])
	else
		@products = Product.all 
  	end

  	if params[:sort_by].blank? == false
  		case params[:sort_by].downcase
	  		when "title"
	  			@products = @products.by_title(params[:order])
	  		when "created_at"
	  			@products = @products.by_created_at(params[:order])
	  		when "ends_at"
	  			@products = @products.by_ends_at(params[:order])
  		end
  	elsif params[:order].blank? == false
  		@products = @products.by_created_at(params[:order])
  	else
  		@products = @products.by_created_at("desc")
  	end

  end
end
