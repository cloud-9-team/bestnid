class StatsController < ApplicationController
  def ganancias
  	@resultados = []
  end

  def calc_ganancias
  	if (params[:dates].blank?)
  		@resultados = []
  		render :ganancias
  		return
  	end

  	comienzo = DateTime.new(params[:dates]['start(1i)'].to_i, params[:dates]['start(2i)'].to_i, params[:dates]['start(3i)'].to_i)
  	fin = DateTime.new(params[:dates]['end(1i)'].to_i, params[:dates]['end(2i)'].to_i, params[:dates]['end(3i)'].to_i)
  	if comienzo > fin then
  		temp = comienzo
  		comienzo = fin
  		fin = temp
  	end

  	comienzo = comienzo.beginning_of_day
  	fin = fin.end_of_day

  	@start = comienzo
  	@end = fin

  	# Comienzo del día en 03:00 UTC, equivalente a 00:00 en Buenos Aires
  	# Fin del día en 02:59 UTC, equivalente a 23:59 en Buenos Aires
  	comienzo = comienzo + 3.hours
  	fin = fin + 3.hours

  	@resultados = Product.finished_only.between(:updated_at, comienzo, fin)
  	render :ganancias
  end

end
