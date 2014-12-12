#encoding: UTF-8
class StatsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :check_dates, only: [:ganancias, :usuarios_registrados]

  def usuarios_registrados
    if (params[:dates])

      fechas = procesar_fechas
      comienzo = fechas[:start_date]
      fin = fechas[:end_date]

      @start = comienzo
      @end = fin
      @temp = true
      @users = User.all.where(:created_at => comienzo..fin)
    else
      @temp = false
    end
  end

  def ganancias

    if params[:dates].blank?
      return
    end

    fechas = procesar_fechas
    comienzo = fechas[:start_date]
    fin = fechas[:end_date]

    @start = comienzo
    @end = fin

    # Comienzo del día en 03:00 UTC, equivalente a 00:00 en Buenos Aires
    # Fin del día en 02:59 UTC, equivalente a 23:59 en Buenos Aires
    comienzo = comienzo + 3.hours
    fin = fin + 3.hours

    @resultados = Product.finished_only.between(:finished_at, comienzo, fin).by_finished_at(:asc)
  end

  private

  def check_admin
    if not user_signed_in? or not current_user.admin
      flash[:alert] = "Acceso no autorizado"
      redirect_to root_path
    end
  end

  def check_dates
    if (params[:dates].present? and 
        ( not Date.valid_date? params[:dates]['start(1i)'].to_i, params[:dates]['start(2i)'].to_i, params[:dates]['start(3i)'].to_i or
          not Date.valid_date? params[:dates]['end(1i)'].to_i, params[:dates]['end(2i)'].to_i, params[:dates]['end(3i)'].to_i))
      flash.now[:alert] = "Se ha introducido una fecha inválida. Por favor verifique."
      render
      return
    end
  end

  def procesar_fechas
    comienzo = DateTime.new(params[:dates]['start(1i)'].to_i, params[:dates]['start(2i)'].to_i, params[:dates]['start(3i)'].to_i)
    fin = DateTime.new(params[:dates]['end(1i)'].to_i, params[:dates]['end(2i)'].to_i, params[:dates]['end(3i)'].to_i)
    if comienzo > fin then
      temp = comienzo
      comienzo = fin
      fin = temp
    end

    comienzo = comienzo.beginning_of_day
    fin = fin.end_of_day

    return {start_date: comienzo, end_date: fin}
  end
end
