class MessagesController < ApplicationController
  
  before_action :authenticate_user!

  def index
  end

  def datatable_list
    @response = Message.includes(:user).all
    @data = @response.map{|m| MessageDecorator.new(m).format }
    render_shared_search_json
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

  private

    def msg_params
      params.permit(:message_json)
    end

    def render_shared_search_json
      respond_to do |format|
        format.json { render 'shared/search' }
      end
    end
end