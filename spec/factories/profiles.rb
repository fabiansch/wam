require 'faker'

FactoryGirl.define do 
  factory :profile do |f|
    f.name { Faker::Name.name }
    f.job { Faker::Company.name }
    f.city { Faker::Address.city }
    f.aboutme { Faker::Company.catch_phrase }
    
    factory :profile_with_talkabouts do
      ignore do
        talkabouts_count 5
      end
      after(:create) do |profile, evaluator|
        create_list(:talkabout, evaluator.talkabouts_count, profile: profile)
        profile.reload
      end
    end
  end
end
