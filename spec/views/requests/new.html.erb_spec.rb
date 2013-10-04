require 'spec_helper'

describe "requests/new" do
  before(:each) do
    assign(:request, stub_model(Request,
      :name => "MyString",
      :sku => "MyString",
      :manufacturer => "MyString",
      :quantity => "MyString",
      :discription => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", requests_path, "post" do
      assert_select "input#request_name[name=?]", "request[name]"
      assert_select "input#request_sku[name=?]", "request[sku]"
      assert_select "input#request_manufacturer[name=?]", "request[manufacturer]"
      assert_select "input#request_quantity[name=?]", "request[quantity]"
      assert_select "input#request_discription[name=?]", "request[discription]"
      assert_select "input#request_url[name=?]", "request[url]"
    end
  end
end
