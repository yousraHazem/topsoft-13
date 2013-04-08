
require 'spec_helper'

describe "communities/new.html.erb" do
    before(:each) do
      view.stub(:community).and_return(mock_model(Community))
    end

    it 'renders a form' do
     render
     expect(view).to render_template(:form => "show")
    end
    
end