require 'spec_helper'

describe PagesController do

  describe "GET #about" do
    it "responds successfully with an HTTP 200 status code" do
      get :about
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
