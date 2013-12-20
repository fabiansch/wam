require 'spec_helper'

describe ProfilesController do

  describe "index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all profiles" do
      profile1 = FactoryGirl.create(:profile)
      profile2 = FactoryGirl.create(:profile)

      get :index
      expect(assigns(:profiles)).to include(profile1)
      expect(assigns(:profiles)).to include(profile2)
    end
  end
end
