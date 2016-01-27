require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :email => "MyText",
      :phone_number => "MyText"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "textarea#user_email[name=?]", "user[email]"

      assert_select "textarea#user_phone_number[name=?]", "user[phone_number]"
    end
  end
end
