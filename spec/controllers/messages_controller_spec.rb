require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  let(:user){ User.create!(email: "foo@bar.com", password: "example01", password_confirmation: "example01") }

  it "should create a trip suggestion with a call to the controller" do
    sign_in user
    post(:create, message_json: message_json, format: :json)
    result = JSON.parse(response.body)
    expect(result["status"]).to eq("success")
  end

  def message_json
    {text: "some text", phone_number: "some number"}.to_json
  end

end