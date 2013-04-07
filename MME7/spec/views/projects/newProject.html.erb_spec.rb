require 'spec_helper'

describe "projects/newProject.html.erb" do
    before(:each) do
      view.stub(:project).and_return(mock_model(Project))
    end

    it 'renders a form' do
     render
     expect(view).to render_template(:partial => "_form")
    end
    
end