class PaginasEstaticasController < ApplicationController

	before_action :authenticate_user!, only: [:estadisticas]
  
  def sobre_nosotros
  end

  def como_funciona
  end

  def estadisticas
  	if (params[:init_date] && params[:end_date])
  		initDate = Date.civil(*params[:init_date].sort.map(&:last).map(&:to_i))
  		endDate = Date.civil(*params[:end_date].sort.map(&:last).map(&:to_i))
		@temp = true
  		@users = User.all.where(:created_at => initDate..endDate)
  	else
  		@temp = false
  	end
  end
end