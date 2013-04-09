describe 'DELETE destroy' do
  before :each do
    @post = FactoryGirl(:post)
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
