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

  describe "new" do
    before(:each) do
      sign_in
      @profile_params = FactoryGirl.attributes_for(:profile)
      @profile = FactoryGirl.create(:profile, @profile_attr)
      allow(controller.current_user).to receive(:build_profile).and_return(@profile)
    end

    it "save the profile to the user" do
      post :new, profile: @profile_params
      profile = assigns(:profile)
      expect(profile.name).to eq(@profile.name)
      expect(profile.job).to eq(@profile[:job])
      expect(profile.city).to eq(@profile[:city])
      expect(profile.aboutme).to eq(@profile[:aboutme])
      expect(profile.gravatar_email).to eq(@profile[:gravatar_email])
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
    end

    it "responds with created" do
      profile = FactoryGirl.create(:profile, @profile_attr)
      allow(controller.current_user).to receive(:build_profile).and_return(profile)
      post :create, profile: {profile: {}}
      expect(subject).to redirect_to(profile_path(profile.id))
    end

    it "responds with error" do
      Profile.stub(:new) { mock_model(Profile, :save => false) }
      profile_mock = Profile.new
      allow(controller.current_user).to receive(:build_profile).and_return(profile_mock)
      post :create, profile: {profile: {}}
      response.should render_template(:new)
    end
  end

  describe "update" do
    before(:each) do
      sign_in
      @profile = FactoryGirl.create(:profile)
    end

    it "updates a profile" do
      params = {name: "Jim Block",
                job: "Chef",
                city: "Hamburg, Germany",
                aboutme: "Just cookin' all day long",
                gravatar_email: "jim@block.com"}
      put :update, id: @profile.id, profile: params
      expect(subject).to redirect_to(profile_path(@profile.id))
      updated_profile = assigns(:profile)
      expect(updated_profile.name).to eq(params[:name])
      expect(updated_profile.job).to eq(params[:job])
      expect(updated_profile.city).to eq(params[:city])
      expect(updated_profile.aboutme).to eq(params[:aboutme])
      expect(updated_profile.gravatar_email).to eq(params[:gravatar_email])
      expect(response.status).to eq(302)
    end

    it "renders edit action when update failed" do
      Profile.stub(:new) { mock_model(Profile, :update => false) }
      Profile.stub(:find).and_return(Profile.new)
      put :update, id: 1, profile: {profile: {}}
      response.should render_template(:edit)
    end

    it "deletes gravatar email when not given" do
      @profile.gravatar_email = "something"
      params = {gravatar_email: ""}
      put :update, id: @profile.id, profile: params
      updated_profile = assigns(:profile)
      expect(updated_profile.gravatar_email).to eq("")
    end
  end

  describe "destroy" do
    before(:each) do
      sign_in
      @profile = FactoryGirl.create(:profile)
    end

    it "deletes the profile" do
      delete :destroy, id: @profile.id
      expect(subject).to redirect_to(profiles_path)
      expect { Profile.find(@profile.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
