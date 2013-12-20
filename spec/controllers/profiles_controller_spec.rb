require 'spec_helper'
require 'support/controller_helpers'

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

  describe "show" do
    it "responds successfully" do
      sign_in
      profile = FactoryGirl.create(:profile)
      get :show, id: profile.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      sign_in
      profile = FactoryGirl.create(:profile)
      get :show, id: profile.id
      expect(response).to render_template("show")
    end

    it "loads a profile" do
      sign_in
      profile = FactoryGirl.create(:profile)
      get :show, id: profile.id
      expect(assigns(:profile)).to eq(profile)
    end
  end
end
