require 'spec_helper'

describe "shared/_profile.html.erb" do
  it "displays the correct gravatar url" do
    profile = stub_model(Profile, gravatar_email: "hallo@wam.de")
    render :partial => "shared/profile.html.erb", :locals => {:profile => profile}

    gravatar_url = "http://www.gravatar.com/avatar/0adb4506bc8a006ba5d8a1744b09e889?s=400"
    expect(rendered).to include(gravatar_url)
  end
end
