class StaticPagesController < ApplicationController

  before_action :authenticate_user!

  def home
    @guests = Guest.where(user: current_user).all
    @suggestions = Place.all.map{|p| p.marker} || []
  end

  def help
  end
end
