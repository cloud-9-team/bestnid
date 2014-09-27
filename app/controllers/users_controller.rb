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
  	if (p1 != p2)
  		flash[:notice]="Las contraseñas no coinciden."
  		redirect_to  new_user_registration_path
  	else
  		User.create(first_name:n,last_name:p,email:u,password:p1)
  	end
  end

  def show
  	@user = User.find(params[:id])
  end
end
