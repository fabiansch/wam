require 'faker'

FactoryGirl.define do 
  factory :profile do |f|
    f.email { Faker::Internet.email }
    f.name { Faker::Name.name }
    f.job { Faker::Company.name }
    f.city { Faker::Address.city }
    f.aboutme { Faker::Company.catch_phrase }
  end
end
