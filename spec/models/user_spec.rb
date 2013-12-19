require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  describe "all attributes are accessible" do
    user = FactoryGirl.create(:user)
    subject { user }
    it { should respond_to(:id) }
    it { should respond_to(:email) }
    it { should respond_to(:profile) }
  end
end
