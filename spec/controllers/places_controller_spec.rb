require 'rails_helper'

RSpec.describe PlacesController, type: :controller do

  let(:user){ User.create!(email: "foo@bar.com", password: "example01", password_confirmation: "example01") }

  it "should create a trip suggestion with a call to the controller" do
    sign_in user
    post(:create, marker: marker_json, reason: "A reason", address: "An address", format: :json)
    result = JSON.parse(response.body)
    expect(result["status"]).to eq("success")
  end

  def marker_json
    {a_marker: "some options"}.to_json
  end

end