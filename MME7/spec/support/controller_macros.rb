module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user , :name=>"sama", :email=>"sama@hotmail.com" , :phone_Nr=>"774747474774" , :address=>"jdjejjsjsnsjjj" , :username=>"sama1", :isAdmin=>false , :password_digest=>"123456")
       # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user
    end
  end
end