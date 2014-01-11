require 'spec_helper'

describe "shared/_want_talk_about.html.erb with all checkboxes equals true and text_fields filled" do
  before(:each) do  
    @profile = stub_model(Profile)
    @profile.talkabouts.create(content:"Ruby on Rails", check:true)
    @profile.talkabouts.create(content:"Angular.js", check:true)
    @profile.talkabouts.create(content:"Objective C", check:true)
    @profile.talkabouts.create(content:"JavaScript", check:true)
    @profile.talkabouts.create(content:"Rock n Roll", check:true)
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
    @profile = stub_model(Profile)
    @profile.talkabouts.create(content:"Ruby on Rails", check:false)
    @profile.talkabouts.create(content:"Angular.js", check:false)
    @profile.talkabouts.create(content:"Objective C", check:false)
    @profile.talkabouts.create(content:"JavaScript", check:false)
    @profile.talkabouts.create(content:"Rock n Roll", check:false)
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
    @profile = stub_model(Profile)
    @profile.talkabouts.create(content:"", check:false)
    @profile.talkabouts.create(content:"", check:true)
    @profile.talkabouts.create(content:"", check:false)
    @profile.talkabouts.create(content:"", check:true)
    @profile.talkabouts.create(content:"", check:false)
  end

  it "no check_boxes should be shown" do
    render :partial => "shared/want_talk_about.html.erb", locals: {profile: @profile}

    expect(rendered).to_not have_selector("span.glyphicon-unchecked")
    expect(rendered).to_not have_selector("span.glyphicon-check")
  end
end
