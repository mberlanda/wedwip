class UsersController < ApplicationController
  
  def index
   @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the WedWip App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :phone_number, :password,
                                   :password_confirmation, :validation_code)
    end
end
