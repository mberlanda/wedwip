require 'rails_helper'
require 'spec_helper'

describe "Signup" do
  
  it "should not create users with invalid signup information" do

    get new_user_session_path
    count_before = User.count
    post user_registration_path, user: { 
                             email: "user@invalid",
                             password: "foo",
                             password_confirmation: "bar"}
    expect(User.count).to eq(count_before)
  end

  it "should create users with valid signup information" do

    get new_user_session_path
    count_before = User.count
    post user_registration_path, user: {
                             email: "user@valid.info",
                             password:              "foobar123",
                             password_confirmation: "foobar123" }
    expect(User.count).to eq(count_before + 1)
  end

end