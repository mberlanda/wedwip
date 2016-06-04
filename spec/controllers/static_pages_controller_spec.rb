require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  let(:user){ User.create!(email: "foo@bar.com", password: "example01", password_confirmation: "example01") }

  it "should login successfully" do
    sign_in user
    get :home
    expect(response).to have_http_status(:success)
  end

end
