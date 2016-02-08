require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: "Example User", email: "user@example.com", phone_number: "0000")
  end

  it "should be valid" do
    expect(@user).to be_valid
  end

  it "should not be valid if name is empty" do
    @user.name = nil
    expect(@user).to_not be_valid
  end

end
