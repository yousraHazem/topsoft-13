require "spec_helper"

describe "posts/_list.html.erb" do

  context "with 2 widgets" do
    before(:each) do
      assign(:posts, [
       
        stub_model(Post, :content => "slicer")
      ])
    end

    it "displays both widgets" do
      render

      rendered.should contain("slicer")
    end
  end
end
