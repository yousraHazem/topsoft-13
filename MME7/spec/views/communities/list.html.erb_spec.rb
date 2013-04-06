require 'spec_helper'
describe "communities/list" do
  it "renders link for each community" do
    assign(:communities, [stub_model(Community), stub_model(Community)])
    render
    expect(view).to render_template(:form => "list", :count => 2)
  end
end

describe "communities/show" do
  it "displays the Community" do
    assign(:community, stub_model(Community,
      :title => "Chicago", :social_profile_info => "zs", :contact_info => "ss"
    ))
    render
    expect(rendered).to include("Chicago")
  end
end

