# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    institute "MyString"
    mobile "MyString"
    phone "MyString"
    fax "MyString"
    address "MyText"
  end
end
