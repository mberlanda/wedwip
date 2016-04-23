class StaticPagesController < ApplicationController

  before_action :authenticate_user!

  def home
    @guests = Guest.where(user: current_user).all    
  end

  def help
  end
end
