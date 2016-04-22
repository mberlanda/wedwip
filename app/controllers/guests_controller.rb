class GuestsController < ApplicationController
  
  before_action :authenticate_user!

  def create
    
    begin
      g = JSON.parse(guest_params.fetch("guest_json")).with_indifferent_access
      Guest.create!(name: g[:name], surname: g[:surname], user: current_user)
      @status = "success"
    rescue ActiveRecord::RecordInvalid
      @status = "invalid input"
    end

    guests = Guest.where(user: current_user).all
    
    respond_to do |format|
      format.json { render json:{ guest_list: guests.to_json, status: @status }  }
    end

  end


  def destroy

    begin
      id_to_delete = guest_params.fetch("id")
      Guest.where(id: id_to_delete, user: current_user).first.delete
      @status = "success"
    rescue ActiveRecord::RecordInvalid
      @status = "invalid input"
    end

    guests = Guest.where(user: current_user).all

    respond_to do |format|
      format.json { render json:{ guest_list: guests.to_json, status: @status }  }
    end
  end

  def guest_params
    params.permit(:guest_json, :id)
  end

end