class MessagesController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @messages = Message.includes(:user).all
  end

  def create
    
    begin
      m = JSON.parse(msg_params.fetch("message_json")).with_indifferent_access
      Message.create!(text: m[:text], phone_number: m[:phone_number], user: current_user)
      @status = "success"
    rescue ActiveRecord::RecordInvalid
      @status = "invalid input"
    end
   
    respond_to do |format|
      format.json { render json:{ status: @status }  }
    end

  end

  def msg_params
    params.permit(:message_json)
  end

  def render_shared_search_json
    respond_to do |format|
      format.json { render 'shared/search' }
    end
  end

end