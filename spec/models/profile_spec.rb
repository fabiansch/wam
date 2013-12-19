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
    it { should respond_to(:gravatar_email) }
  end

  describe "image url" do
    it "returns user email hash if no gravatar email is given" do
      profile = FactoryGirl.create(:profile)
      profile.user = FactoryGirl.create(:user)
      profile.user.email = 'hallo@wam.com'
      expect(profile.gravatar_url).to eq('http://www.gravatar.com/avatar/1a0dc1158248d76b300740262f2c0667')
    end

    it "returns a valid gravatar image url" do
      profile = FactoryGirl.create(:profile)
      profile.gravatar_email = '123456@wam.com'
      expect(profile.gravatar_url).to eq('http://www.gravatar.com/avatar/7bed7e6074236f335598d8b3c7b5cbe4')
    end
  end
end
