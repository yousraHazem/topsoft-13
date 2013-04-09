require 'factory_girl'
require 'spec_helper'

describe PostsController do
  before :each do
    @post = FactoryGirl.create(:post)
  end
  
  it "deletes the post" do
    expect{
      delete :destroy, id: @post       
    }.to change(Post,:count).by(-1)
  end
    
  it "redirects to group show" do
    delete :destroy, id: @post
    response.should redirect_to(:controller => "groups", :action => 'show')
  end
end
