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
    it { should respond_to(:company) }
    it { should respond_to(:user) }
    it { should respond_to(:gravatar_email) }
    it { should respond_to(:twitter_handle) }
    it { should respond_to(:twitter_url) }
    it { should respond_to(:xing_handle) }
    it { should respond_to(:xing_url) }
    it { should respond_to(:linkedin_handle) }
    it { should respond_to(:linkedin_url) }
  end

  describe "all class methods are accessible" do
    subject { Profile }
    it { should respond_to(:allowed_params) }
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

  describe "twitter url" do
    before(:all) do
      @profile = FactoryGirl.create(:profile)
    end

    it "returns twitter url if handle is givne" do
      @profile.twitter_handle = 'jim_block'
      expect(@profile.twitter_url).to eq("https://www.twitter.com/jim_block")
    end

    it "returns nothing if no handle is given" do
      @profile.twitter_handle = nil
      expect(@profile.twitter_url).to be_blank
    end
  end

  describe "xing url" do
    before(:all) do
      @profile = FactoryGirl.create(:profile)
    end

    it "returns xing url if handle is givne" do
      @profile.xing_handle = 'jim_block'
      expect(@profile.xing_url).to eq("https://www.xing.com/jim_block")
    end

    it "returns nothing if no handle is given" do
      @profile.xing_handle = nil
      expect(@profile.xing_url).to be_blank
    end
  end

  describe "linkedin url" do
    before(:all) do
      @profile = FactoryGirl.create(:profile)
    end

    it "returns linkedin url if handle is givne" do
      @profile.linkedin_handle = 'jim_block'
      expect(@profile.linkedin_url).to eq("https://www.linkedin.com/jim_block")
    end

    it "returns nothing if no handle is given" do
      @profile.linkedin_handle = nil
      expect(@profile.linkedin_url).to be_blank
    end
  end
end
