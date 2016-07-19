require 'rails_helper'
 
describe GuestsController do

  let!(:controller) { GuestsController.new }

  before do
    user = User.create!(email: 'example@example.com', password: '012345678')
    Guest.create!(name: 'example', surname: 'example', user: user)
  end

  it "should get the model name from the controller" do
    expect(controller.model_name).to eq('Guest')
  end

  it "should list all guests" do
    expect(controller.list_all).to eq(Guest.all)
  end

end