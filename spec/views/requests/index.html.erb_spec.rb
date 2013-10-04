require 'spec_helper'

describe "requests/index" do
  before(:each) do
    assign(:requests, [
      stub_model(Request,
        :name => "Name",
        :sku => "Sku",
        :manufacturer => "Manufacturer",
        :quantity => "Quantity",
        :discription => "Discription",
        :url => "Url"
      ),
      stub_model(Request,
        :name => "Name",
        :sku => "Sku",
        :manufacturer => "Manufacturer",
        :quantity => "Quantity",
        :discription => "Discription",
        :url => "Url"
      )
    ])
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => "Quantity".to_s, :count => 2
    assert_select "tr>td", :text => "Discription".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
