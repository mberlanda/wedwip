require 'rails_helper'

RSpec.describe GuestsController, type: :controller do

  let(:user){ User.create!(email: "foo@bar.com", password: "example01", password_confirmation: "example01") }

  it "should create guests with a call to the controller" do

    guests_count = Guest.count

    sign_in user
    post :create, guest_json: guest_json_example,  format: :json
    
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

  it "should destroy a guest" do
    pending "destroy to do"
    guests_count = Guest.count

    sign_in user
    get :new, guest_json: guest_json_example
    expect(Guest.count).to eq( guests_count + 1 )

    get :destroy, guest_json: guest_json_example
    expect(Guest.count).to eq( guests_count)    
  end

  def guest_json_example
    {name: "Name", surname: "Surname"}.to_json
  end
end