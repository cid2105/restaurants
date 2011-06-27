require 'spec_helper'

describe "dishes/index.html.erb" do
  before(:each) do
    assign(:dishes, [
      stub_model(Dish,
        :name => "Name",
        :pic => "Pic",
        :price => 1.5,
        :restaurant => nil
      ),
      stub_model(Dish,
        :name => "Name",
        :pic => "Pic",
        :price => 1.5,
        :restaurant => nil
      )
    ])
  end

  it "renders a list of dishes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pic".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
