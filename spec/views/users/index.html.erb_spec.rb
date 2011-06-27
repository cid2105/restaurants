require 'spec_helper'

describe "users/index.html.erb" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :reset_password_token => "Reset Password Token"
      ),
      stub_model(User,
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :reset_password_token => "Reset Password Token"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password Confirmation".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Reset Password Token".to_s, :count => 2
  end
end
