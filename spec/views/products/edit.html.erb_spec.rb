require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :sku => "MyString",
      :provider => nil,
      :manufacturer => "MyString",
      :quantity => "MyString",
      :discription => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_sku[name=?]", "product[sku]"
      assert_select "input#product_provider[name=?]", "product[provider]"
      assert_select "input#product_manufacturer[name=?]", "product[manufacturer]"
      assert_select "input#product_quantity[name=?]", "product[quantity]"
      assert_select "input#product_discription[name=?]", "product[discription]"
      assert_select "input#product_url[name=?]", "product[url]"
    end
  end
end
