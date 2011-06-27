require 'spec_helper'

describe "dishes/show.html.erb" do
  before(:each) do
    @dish = assign(:dish, stub_model(Dish,
      :name => "Name",
      :pic => "Pic",
      :price => 1.5,
      :restaurant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pic/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
