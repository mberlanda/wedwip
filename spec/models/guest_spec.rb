require 'rails_helper'

RSpec.describe Guest, type: :model do

  let(:example_user){ User.create(email: "foo@bar.com", password: "example01", password_confirmation: "example01") }

  it "should create a guest with the reference of the user who invited him/her" do

    guest = Guest.new(name: "Name", surname: "Surname", user: example_user)
    expect(guest.user).to eq(example_user)

  end


end
