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

  it "should contain a valid email" do
    @user.email = nil
    expect(@user).to_not be_valid

    @user.email = "user@name"
    expect(@user).to_not be_valid

    @user.email = "foo@bar.com"
    expect(@user).to be_valid    
  end

  it "should contain a valid phone_number" do
    @user.phone_number = "0000a"
    expect(@user).to_not be_valid

    @user.phone_number = "0000"
    expect(@user).to be_valid    
  end

  it "should adjust the format of the name and the email" do
    usr1 = User.new(name: "exAMPLe USeR", email: "uSER@EXAMple.coM", phone_number: "0000")
    usr1.save!
    expect(@user.name).to eq("Example User")
    expect(@user.email).to eq("user@example.com")
  end

end
