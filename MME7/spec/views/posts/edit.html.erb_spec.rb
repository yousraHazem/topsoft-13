
 require "spec_helper"

      describe "posts/edit" do
        before(:each) do
          @post = assign(:post, stub_model(Post))
        end

        it "renders the group show template" do
          stub_template "posts/edit.html.erb" => "This content"
          render
          expect(rendered).to match /This content/
        end
      end