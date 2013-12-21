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
    before(:each) do
      sign_in
      @profile = instance_double("Profile", id: 1)
      get :show, id: @profile.id
    end

    it "responds successfully" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end

    it "loads a profile" do
      profile = assigns(:profile)
      expect(profile.id).to eq(@profile.id)
    end
  end

  describe "edit" do
    before(:each) do
      sign_in
      @profile = instance_double("Profile", id: 1)
      get :edit, id: @profile.id
    end

    it "responds successfully" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end

    it "load a profile" do
      profile = assigns(:profile)
      expect(profile.id).to eq(@profile.id)
    end
  end

  describe "create" do
    before(:each) do
      sign_in
      @profile_attr = FactoryGirl.attributes_for(:profile)
      @profile = FactoryGirl.create(:profile, @profile_attr)
      allow(controller.current_user).to receive(:build_profile).and_return(@profile)
    end

    it "responds with created" do
      post :create, profile: @profile_attr
      expect(subject).to redirect_to(profile_path(@profile.id))
    end
  end
end
