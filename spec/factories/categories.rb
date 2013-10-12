# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "MyString"
    parent nil
    lft 1
    rgt 1
    depth 1
  end
end
