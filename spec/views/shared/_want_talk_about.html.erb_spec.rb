require 'spec_helper'

describe "shared/_want_talk_about.html.erb with all checkboxes equals true and text_fields filled" do
  before(:each) do
    @profile = stub_model(Profile,
                         talk_about_string_1: "Ruby on Rails",
                         talk_about_boolean_1: true,
                         talk_about_string_2: "Angular.js",
                         talk_about_boolean_2: true,
                         talk_about_string_3: "Objective C",
                         talk_about_boolean_3: true,
                         talk_about_string_4: "JavaScript",
                         talk_about_boolean_4: true,
                         talk_about_string_5: "Rock n Roll",
                         talk_about_boolean_5: true)
  end
  
  it "displays the correct talk_about_stings" do
    render :partial => "shared/want_talk_about.html.erb", locals: {profile: @profile}

    expect(rendered).to include("Ruby on Rails")
    expect(rendered).to include("Angular.js")
    expect(rendered).to include("Objective C")
    expect(rendered).to include("JavaScript")
    expect(rendered).to include("Rock n Roll")
  end

  it "uses only bootstrap css class glyphicon-check" do
    render :partial => "shared/want_talk_about.html.erb", locals: {profile: @profile}

    expect(rendered).to have_selector("span.glyphicon-check")
    expect(rendered).to_not have_selector("span.glyphicon-unchecked")
  end
end

describe "shared/_want_talk_about.html.erb with all checkboxes equals false and text_fields filled" do
  before(:each) do
    @profile = stub_model(Profile,                                                                                   talk_about_string_1: "Ruby on Rails",
                         talk_about_boolean_1: false,
                         talk_about_string_2: "Angular.js",
                         talk_about_boolean_2: false,
                         talk_about_string_3: "Objective C",
                         talk_about_boolean_3: false,
                         talk_about_string_4: "JavaScript",
                         talk_about_boolean_4: false,
                         talk_about_string_5: "Rock n Roll",
                         talk_about_boolean_5: false)
  end

  it "displays the correct talk_about_stings" do
    render :partial => "shared/want_talk_about.html.erb", locals: {profile: @profile}

    expect(rendered).to include("Ruby on Rails")
    expect(rendered).to include("Angular.js")
    expect(rendered).to include("Objective C")
    expect(rendered).to include("JavaScript")
    expect(rendered).to include("Rock n Roll")
  end

  it "uses only bootstrap css class glyphicon-unchecked" do
    render :partial => "shared/want_talk_about.html.erb", locals: {profile: @profile}

    expect(rendered).to have_selector("span.glyphicon-unchecked")
    expect(rendered).to_not have_selector("span.glyphicon-check")
  end
end

describe "shared/_want_talk_about.html.erb with all text_fields not filled" do
  before(:each) do
    @profile = stub_model(Profile,
                         talk_about_string_1: "",
                         talk_about_boolean_1: false,
                         talk_about_string_2: "",
                         talk_about_boolean_2: true,
                         talk_about_string_3: "",
                         talk_about_boolean_3: false,
                         talk_about_string_4: "",
                         talk_about_boolean_4: true,
                         talk_about_string_5: "",
                         talk_about_boolean_5: false)
  end

  it "no check_boxes should be shown" do
    render :partial => "shared/want_talk_about.html.erb", locals: {profile: @profile}

    expect(rendered).to_not have_selector("span.glyphicon-unchecked")
    expect(rendered).to_not have_selector("span.glyphicon-check")
  end
end
