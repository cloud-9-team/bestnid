class UsersController < ApplicationController

before_action :authenticate_user!, only: [:index, :show]
	
  def index
  	@users = User.all
  end

def new
  
    n = params[:first_name]
    a = params[:last_name]
    u = params[:email]
    p1 = params[:password]
    p2 = params[:password_confirmation]
    country = params[:country]
    province = params[:province]
    city = params[:city]
    dom = params[:domicile]
    c1 = params[:card_1]
    c2 = params[:card_2]
    c3 = params[:card_3]
    c4 = params[:card_4]
    adm = false
    if (p1 != p2)
      flash[:notice]="Las contraseñas no coinciden."
      redirect_to  new_user_registration_path
    else
      User.create(first_name:n,last_name:p,email:u,password:p1,
        country:country,province:province,city:city,domicile:dom,
        card_1:c1,card_2:c2,card_3:c3,card_4:c4,admin:adm)
    end
  end

  def update
    usuario = current_user
    usuario.card_1 = params[:user][:card_1]
    usuario.card_2 = params[:user][:card_2]
    usuario.card_3 = params[:user][:card_3]
    usuario.card_4 = params[:user][:card_4]
    usuario.save
    flash[:notice] = "Los datos de la tarjeta de crédito se actualizaron correctamente."
    redirect_to product_path(params[:product_id])
  end

  def show
  	@user = User.find(params[:id])
  end
end
