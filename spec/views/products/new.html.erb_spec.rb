require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :sku => "MyString",
      :provider => nil,
      :manufacturer => "MyString",
      :quantity => "MyString",
      :discription => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", products_path, "post" do
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
