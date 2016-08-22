class UsersController < ApplicationController

  def check
    @email = params.require(:email)
    users = User.where(email: @email).all
    
    @success = true
    @success = false if users.empty?

    render :layout => false
  end

  def update_password
    p = params.require(:change).permit(:email, :password, :password_confirmation)

    u = User.find_by(email: p[:email])
    u.password = p[:password]
    u.password_confirmation = p[:password_confirmation]
    u.save!

    flash[:success] = "Password cambiata con successo"     sign_in(u)
redirect_to root_url   end end
