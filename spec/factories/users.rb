require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password '1234567'
    f.password_confirmation '1234567'
    association :profile, factory: :profile
  end
end
