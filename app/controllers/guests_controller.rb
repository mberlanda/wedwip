class GuestsController < ApplicationController
  
  before_action :authenticate_user!

  def new
    g = JSON.parse(guest_params.fetch("guest_json")).with_indifferent_access
    Guest.create!(name: g[:name], surname: g[:surname], user: current_user)
    render :nothing => true

  end

  def edit
  end

  def destroy
  end


  def guest_params
    params.permit(:guest_json)
  end

end