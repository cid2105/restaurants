require 'spec_helper'

describe "dishes/new.html.erb" do
  before(:each) do
    assign(:dish, stub_model(Dish,
      :name => "MyString",
      :pic => "MyString",
      :price => 1.5,
      :restaurant => nil
    ).as_new_record)
  end

  it "renders new dish form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dishes_path, :method => "post" do
      assert_select "input#dish_name", :name => "dish[name]"
      assert_select "input#dish_pic", :name => "dish[pic]"
      assert_select "input#dish_price", :name => "dish[price]"
      assert_select "input#dish_restaurant", :name => "dish[restaurant]"
    end
  end
end
