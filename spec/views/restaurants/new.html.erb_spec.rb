require 'spec_helper'

describe "restaurants/new.html.erb" do
  before(:each) do
    assign(:restaurant, stub_model(Restaurant,
      :name => "MyString",
      :street => "MyString",
      :city => "MyString",
      :zip => "MyString",
      :website => "MyString",
      :number => "MyString"
    ).as_new_record)
  end

  it "renders new restaurant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => restaurants_path, :method => "post" do
      assert_select "input#restaurant_name", :name => "restaurant[name]"
      assert_select "input#restaurant_street", :name => "restaurant[street]"
      assert_select "input#restaurant_city", :name => "restaurant[city]"
      assert_select "input#restaurant_zip", :name => "restaurant[zip]"
      assert_select "input#restaurant_website", :name => "restaurant[website]"
      assert_select "input#restaurant_number", :name => "restaurant[number]"
    end
  end
end
