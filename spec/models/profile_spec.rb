require 'spec_helper'

describe Profile do
  it "has a valid factory" do
    FactoryGirl.create(:profile).should be_valid
  end

  describe "all attributes are accessible" do
    profile = FactoryGirl.create(:profile)
    subject { profile }
    it { should respond_to(:id) }
    it { should respond_to(:email) }
    it { should respond_to(:name) }
    it { should respond_to(:job) }
    it { should respond_to(:city) }
    it { should respond_to(:aboutme) }
  end
end
