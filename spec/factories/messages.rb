# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    from nil
    to nil
    content "MyText"
  end
end
