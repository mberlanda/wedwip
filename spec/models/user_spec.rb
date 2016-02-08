require 'rails_helper'
require 'spec_helper'

describe User do
  
  before do
    @user = new_user()
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
    usr1 = new_user(name: "exAMPLe USeR", email: "uSER@EXAMple.coM")
    usr1.save!
    expect(@user.name).to eq("Example User")
    expect(@user.email).to eq("user@example.com")
  end

  it "should have a password not blank" do
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).to_not be_valid
  end

  it "should have a valid password" do
    @user.password = @user.password_confirmation = "a" * 5
    expect(@user).to_not be_valid
  end

private

  def new_user(options={})
    user_params = { name: "Example User", email: "user@example.com",
               phone_number: "0000", password: "foobar", 
               password_confirmation: "foobar"}.merge(options)
    User.new(user_params)
  end
end
