class WelcomeController < ApplicationController
  def index
  	# @query = Product.search do
   #      fulltext params[:search]
   #  end
    #@products = @query.results
    @products = Product.all
  end
end
