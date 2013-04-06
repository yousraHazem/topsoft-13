require 'spec_helper'
 
describe "communities/new.html.erb" do
  before(:each) do
    @post = assign(:community, stub_model(Community)).as_new_record.as_null_object
 end
  it "renders the new community" do
    rendered.should have_selector('form',:method => "post",:action => 'new') do |form|
      form.should have_selector('label',:for=>'community_title',:content=>'Title')
      form.should have_selector('input',:type => "string",:name=>'community[title]',:id=>'community_title')
      form.should have_selector('label',:for=>'community_social_profile_info',:content=>'Social_profile_info')
      form.should have_selector('labe',:type=>'text',:name=>'community[social_profile_info]',:id=>'community_social_profile_info')
      form.should have_selector('input',:type=>'submit',:value=>'Publish')
    end
  end
 
end
