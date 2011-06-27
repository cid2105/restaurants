require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "Email",
      :password => "Password",
      :password_confirmation => "Password Confirmation",
      :reset_password_token => "Reset Password Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Password/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Password Confirmation/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Reset Password Token/)
  end
end
