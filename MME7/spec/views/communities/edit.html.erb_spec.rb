
 require "spec_helper"

      describe "communities/edit" do
        before(:each) do
          @community = assign(:community, stub_model(Community))
        end

        it "renders the list template" do
          stub_template "communities/edit.html.erb" => "This content"
          render
          expect(rendered).to match /This content/
        end
      end