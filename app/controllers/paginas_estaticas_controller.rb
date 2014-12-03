class PaginasEstaticasController < ApplicationController

	before_action :authenticate_user!, only: [:estadisticas]
  
  def sobre_nosotros
  end

  def como_funciona
  end

  def estadisticas  	
  end

end
