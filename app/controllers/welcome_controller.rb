class WelcomeController < ApplicationController
  def index
  	@query = Product.search do
         fulltext params[:search]
    end
    @products = @query.results

  end
end
