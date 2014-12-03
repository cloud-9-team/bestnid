#encoding: UTF-8
class UsersController < ApplicationController

before_action :authenticate_user!, only: [:index, :show, :update]
	
  def index
  	@users = User.all
  end

  def edit
  end 

  def update
    usuario = current_user
    usuario.card_1 = params[:user][:card_1]
    usuario.card_2 = params[:user][:card_2]
    usuario.card_3 = params[:user][:card_3]
    usuario.card_4 = params[:user][:card_4]
    usuario.expires_on = params[:user][:expires_on]
    usuario.security_code = params[:user][:security_code]
    usuario.card_owner_first_name = params[:user][:card_owner_first_name]
    usuario.card_owner_last_name = params[:user][:card_owner_last_name]
    usuario.save
    flash[:notice] = "Los datos de la tarjeta de crédito se actualizaron correctamente."
    redirect_to product_path(params[:product_id])
    
  end

  def show
  	@user = User.find(params[:id])
  end
end
