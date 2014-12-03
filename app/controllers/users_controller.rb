#encoding: UTF-8
class UsersController < ApplicationController

before_action :authenticate_user!, only: [:index, :show, :update, :destroy]
	
  def index
  	@users = User.all
  end

  def edit
  end 

  def update
    usuario = current_user
    usuario.update_attributes(credit_card_params)

    respond_to do |format|
      if usuario.errors.any?
        format.html { 
          flash[:alert] = view_context.generate_html_error(usuario)
          redirect_to product_path(params[:product_id])
        }
        format.js { flash.now[:alert] = view_context.generate_html_error(usuario) }
      else
        format.html { 
          flash[:notice] = "Los datos de la tarjeta de crédito se actualizaron correctamente."
          redirect_to product_path(params[:product_id])
        }
        format.js { flash.now[:notice] = "Los datos de la tarjeta de crédito se actualizaron correctamente." }
      end
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
    user = current_user
    if user.authenticate!(params[:password])
         user.destroy
         flash[:notice] = "La cuenta fue cerrada."
         redirect_to welcome_index_path
    else
         flash[:alert] = "Contraseña incorrecta. Cuenta NO eliminada."
         redirect_to welcome_index_path
    end
  end

  private
    def credit_card_params
      params.require(:user).permit(:card_1, :card_2, :card_3, :card_4, :security_code, :expires_on, :card_owner_first_name, :card_owner_last_name)
    end

end
