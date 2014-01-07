require 'spec_helper'

describe "shared/_would_like_to.html.erb with all shown checkboxes equals true" do
  before(:each) do
    @profile = stub_model(Profile,
                         meet_for_coffee: true,
                         attend_meetings: true,
                         be_mentor: true,
                         own_like_string: "be a student",
                         own_like_boolean: true)
  end

  it "displays the correct own_like_string" do
    render :partial => "shared/would_like_to.html.erb", locals: {profile: @profile}

    expect(rendered).to include("be a student")
  end

  it "uses only bootstrap css class glyphicon-check" do
    render :partial => "shared/would_like_to.html.erb", locals: {profile: @profile}

    expect(rendered).to have_selector("span.glyphicon-check")
    expect(rendered).to_not have_selector("span.glyphicon-unchecked")
  end
end

describe "shared/_would_like_to.html.erb with all shown checkboxes equals false" do
  before(:each) do
    @profile = stub_model(Profile,
                         meet_for_coffee: false,
                         attend_meetings: false,
                         be_mentor: false,
                         own_like_string: "",
                         own_like_boolean: true)
  end

  it "uses only bootstrap css class glyphicon-unchecked, own_like_boolean should not be shown" do
    render :partial => "shared/would_like_to.html.erb", locals: {profile: @profile}

    expect(rendered).to have_selector("span.glyphicon-unchecked")
    expect(rendered).to_not have_selector("span.glyphicon-check")
  end
end
