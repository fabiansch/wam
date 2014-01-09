# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :talkabout do
    content "MyString"
    check false
  end
end
