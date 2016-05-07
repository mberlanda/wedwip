class PlacesController < ApplicationController

  before_action :authenticate_user!

  def create
    
    begin
      marker = JSON.parse(marker_params.fetch("marker"))
      Place.create!(marker: marker, user: current_user)
      @status = "success"
    rescue ActiveRecord::RecordInvalid
      @status = "invalid input"
    end

    places = Place.all.map{ |p| p.marker }
    
    respond_to do |format|
      format.json { render json:{ markers: places.to_json, status: @status }  }
    end

  end


  def marker_params
    params.permit(:marker)
  end
end
