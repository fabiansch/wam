require 'spec_helper'

describe Profile do
  it "has a valid factory" do
    FactoryGirl.create(:profile).should be_valid
  end

  describe "all attributes are accessible" do
    profile = FactoryGirl.create(:profile)
    subject { profile }
    it { should respond_to(:id) }
    it { should respond_to(:name) }
    it { should respond_to(:job) }
    it { should respond_to(:city) }
    it { should respond_to(:aboutme) }
    it { should respond_to(:user) }
  end

  describe "image urls" do
    profile = FactoryGirl.create(:profile)

    it "has a valid gravatar email" do
      profile.gravatar_email = '123456@wam.com'
      expect(profile.gravatar_url).to eq('http://www.gravatar.com/avatar/7bed7e6074236f335598d8b3c7b5cbe4')
    end

    it "has uses normal email if no gravatar email is provided" do
      profile.user = FactoryGirl.create(:user)
      profile.user.email = '12@wam.com'
      expect(profile.gravatar_url).to eq('http://www.gravatar.com/avatar/83a512e6fea16d1ab59a7d6ae63c87a1')
    end
  end
end
