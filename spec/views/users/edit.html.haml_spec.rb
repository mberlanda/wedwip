require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :email => "MyText",
      :phone_number => "MyText"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "textarea#user_email[name=?]", "user[email]"

      assert_select "textarea#user_phone_number[name=?]", "user[phone_number]"
    end
  end
end
