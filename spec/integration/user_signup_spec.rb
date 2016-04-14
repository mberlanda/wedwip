require 'rails_helper'
require 'spec_helper'

describe UsersController do
  
  it "should not create users with invalid signup information" do

    get new_user_path
    count_before = User.count
    post users_path, user: { name:  "",
                             email: "user@invalid",
                             phone_number: "3333a",
                             password:              "foo",
                             password_confirmation: "bar",
                             validation_code: '' }
    expect(User.count).to eq(count_before)
  end

  it "should create users with valid signup information" do

    get new_user_path
    count_before = User.count
    post users_path, user: { name:  "Pinco Pallino",
                             email: "user@valid.info",
                             phone_number: "3333",
                             password:              "foobar",
                             password_confirmation: "foobar",
                             validation_code: User::VALIDATION_CODE }
    expect(User.count).to eq(count_before + 1)
    expect(is_logged_in?).to eq true

  end

  private

    def is_logged_in?
      !session[:user_id].nil?
    end
end