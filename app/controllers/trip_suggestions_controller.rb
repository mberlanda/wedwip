class TripSuggestionsController < ApplicationController
  
  before_action :authenticate_user!

  def create
    
    begin
      s = JSON.parse(suggestion_params.fetch("suggestion_json")).with_indifferent_access
      TripSuggestion.create!(name: s[:name], title: s[:title], message: s[:message], user: current_user)
      @status = "success"
    rescue ActiveRecord::RecordInvalid
      @status = "invalid input"
    end

    suggestions = TripSuggestion.all
    
    respond_to do |format|
      format.json { render json:{ suggestion_json: suggestions.to_json, status: @status }  }
    end

  end


  def suggestion_params
    params.permit(:suggestion_json)
  end

end