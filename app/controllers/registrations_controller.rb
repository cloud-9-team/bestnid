class RegistrationsController < Devise::RegistrationsController
 
  private
 
  def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, 
    	:password_confirmation, :country, :province, :city, :domicile, 
    	:card_1, :card_2, :card_3, :card_4, :genre, :admin, :security_code, :expires_on,
    	:card_owner_first_name, :card_owner_last_name)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, 
    	:password_confirmation, :current_password, :country, :province, :city, :domicile,
    	:card_1, :card_2, :card_3, :card_4, :genre, :admin, :security_code, :expires_on,
    	:card_owner_first_name, :card_owner_last_name)
  end
end