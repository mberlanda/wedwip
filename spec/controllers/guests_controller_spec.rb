require 'rails_helper'

RSpec.describe GuestsController, type: :controller do

  let(:user){ User.create!(email: "foo@bar.com", password: "example01", password_confirmation: "example01") }

  it "should create guests with a call to the controller" do

    guests_count = Guest.count

    sign_in user
    post :create, guest_json: guest_json_example, format: :json
    
    result = JSON.parse(response.body)
    expect(result["status"]).to eq("success")
    expect(Guest.count).to eq( guests_count + 1 )
   end

  it "should not duplicate guests" do

    guests_count = Guest.count

    sign_in user
    post(:create, guest_json: guest_json_example, format: :json)
    post(:create, guest_json: guest_json_example, format: :json)
    
    result = JSON.parse(response.body)
    expect(result["status"]).to eq("invalid input")
    expect(Guest.count).to eq( guests_count + 1 )
  end

  it "should delete a guest" do

    guests_count = Guest.count

    sign_in user
    post :create, guest_json: guest_json_example, format: :json
    expect(Guest.count).to eq( guests_count + 1 )

    guest = parse_first_guest(response.body)
    
    delete :destroy, id: guest["id"], format: :json
    expect(Guest.count).to eq( guests_count)    
  end

  def guest_json_example
    {name: "Name", surname: "Surname"}.to_json
  end

  def parse_first_guest(body)
    guest_list = parse_guest_list(body)
    JSON.parse(guest_list).first
  end

  def parse_guest_list(body)
    JSON.parse(body)["guest_list"]
  end

end