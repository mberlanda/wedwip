class UsersController < ApplicationController

  def check
    @email = params.require(:email)
    users = User.where(email: @email).all
    
    @success = true
    @success = false if users.empty?

    render :layout => false
  end
end