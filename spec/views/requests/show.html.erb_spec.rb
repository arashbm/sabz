require 'spec_helper'

describe "requests/show" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :name => "Name",
      :sku => "Sku",
      :manufacturer => "Manufacturer",
      :quantity => "Quantity",
      :discription => "Discription",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Sku/)
    rendered.should match(/Manufacturer/)
    rendered.should match(/Quantity/)
    rendered.should match(/Discription/)
    rendered.should match(/Url/)
  end
end
