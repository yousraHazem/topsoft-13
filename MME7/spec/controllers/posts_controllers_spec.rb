describe 'DELETE destroy' do
  before :each do
    @contact = Factory(:contact)
  end
  
  it "deletes the contact" do
    expect{
      delete :destroy, id: @contact        
    }.to change(Contact,:count).by(-1)
  end
    
  it "redirects to contacts#index" do
    delete :destroy, id: @contact
    response.should redirect_to contacts_url
  end
end
