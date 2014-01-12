require 'faker'

FactoryGirl.define do
  factory :talkabout do |f|
    f.content 'Want to talk about programming.'
    f.check true
  end
end
