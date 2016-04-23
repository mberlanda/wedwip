require 'rails_helper'

RSpec.describe TripSuggestionsController, type: :controller do

  let(:user){ User.create!(email: "foo@bar.com", password: "example01", password_confirmation: "example01") }

  it "should create a suggestion with a call to the controller" do

    suggestions_count = TripSuggestion.count

    sign_in user
    post :create, suggestion_json: suggestion_json_example, format: :json
    
    result = JSON.parse(response.body)
    expect(result["status"]).to eq("success")
    expect(TripSuggestion.count).to eq( suggestions_count + 1 )
   end


   def suggestion_json_example
    {
      name: "Pinco Pallino",
      title: "Restaurant in a City",
      message: "You should definitely try this place"
    }.to_json

   end

end