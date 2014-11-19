class WelcomeController < ApplicationController
  def index
  	products = Product.all
  	products.each do |p|
  		if (Time.now > (p.created_at + p.totalDays.days))
  			p.finished = true
  			p.save
  		end
  	end
	if params[:search]
		@products = Product.search(params[:search])
	else
		@products = Product.where(finished: false) 
  	end
  end
end
