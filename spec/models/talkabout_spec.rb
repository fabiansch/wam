require 'spec_helper'

describe Talkabout do
  it "has a valid factory" do
    FactoryGirl.create(:talkabout).should be_valid
  end

  describe "all attributes are accessible" do
    user = FactoryGirl.create(:talkabout)
    subject { user }
    it { should respond_to(:content) }
    it { should respond_to(:check) }
    it { should respond_to(:profile_id) }
  end
end
