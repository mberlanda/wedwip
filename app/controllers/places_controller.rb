class PlacesController < ApplicationController
  include DatatableList

  before_action :authenticate_user!

  def index
  end

  def create
    
    begin
      marker = JSON.parse(marker_params.fetch("marker"))
      reason = marker_params.fetch(:reason)
      full_address = marker_params.fetch(:address)
      Place.create!(marker: marker, user: current_user, reason: reason, address: full_address)
      @status = "success"
    rescue ActiveRecord::RecordInvalid
      @status = "invalid input"
    end

    places = Place.all.map{ |p| p.marker }
    
    respond_to do |format|
      format.json { render json:{ markers: places.to_json, status: @status }  }
    end

  end

  private

  def marker_params
    params.permit(:marker, :reason, :address)
  end
end
