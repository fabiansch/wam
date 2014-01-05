require 'spec_helper'

describe "shared/_profile.html.erb" do
  before(:each) do
    @profile = stub_model(Profile,
        gravatar_email: "hallo@wam.de",
        name: "John Doe",
        job: "Developer",
        city: "Hamburg")
  end

  it "displays the correct gravatar url" do
    render :partial => "shared/profile.html.erb", locals: {profile: @profile}

    gravatar_url = "http://www.gravatar.com/avatar/0adb4506bc8a006ba5d8a1744b09e889?s=400"
    expect(rendered).to include(gravatar_url)
  end

  it "displays the basic user information" do
    render :partial => "shared/profile.html.erb", locals: {profile: @profile}

    expect(rendered).to include("John Doe")
    expect(rendered).to include("Developer")
    expect(rendered).to include("Hamburg")
  end

  it "shows an editi/delete button if the current user is the profiles user" do
    user = stub_model(User)
    @profile.user = user
    render :partial => "shared/profile.html.erb", locals: {profile: @profile,
                                                            current_user: user}

    expect(rendered).to include("Edit")
    expect(rendered).to include("Delete")
  end

  it "shows no edit/delete button if the current user is not the profiles user" do
    user = stub_model(User)
    @profile.user = nil
    render :partial => "shared/profile.html.erb", locals: {profile: @profile,
                                                            current_user: user}

    expect(rendered).to_not include("Edit")
    expect(rendered).to_not include("Delete")
  end
end
