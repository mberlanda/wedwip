require 'rails_helper'
require 'spec_helper'

describe UsersController do
  
  it " should not create users with invalid signup information" do
    get users_path
    count_before = User.count
    post users_path, user: { name:  "",
                             email: "user@invalid",
                             phone_number: "3333a",
                             password:              "foo",
                             password_confirmation: "bar" }
    expect(User.count).to eq(count_before)
  end

end