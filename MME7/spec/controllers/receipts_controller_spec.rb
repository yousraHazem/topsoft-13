require 'spec_helper'
describe ReceiptsController do 
 def valid_attributes
    {:name => 'Market'}
  end

  def invalid_attributes
   {:name => ''}
  end

  describe "GET new" do
		it "assigns a new Receipt as @receipt" do
			get :new
			assigns(:receipt).should be_a_new(Receipt)
		end
	end
	describe "POST create" do
		describe "with valid params" do
			it "creates a new Receipt" do
				Receipt.any_instance.stub(:create)
			end
			it "redirects to the list" do
				post :create, {:receipt => valid_attributes}
				response.should redirect_to( 'http://test.host/receipts/list')
			end
		end
end
describe "GET edit" do
			it "assigns the requested receipt as @receipt" do
				receipt = Receipt.create! valid_attributes
				get :edit, {:id => receipt.to_param}
				assigns(:receipt).should eq(receipt)
			end
	end
	describe "PUT update" do
		describe "with valid params" do
			it "updates the requested receipt" do
				Receipt.any_instance.stub(:update)
				receipt = Receipt.create! valid_attributes
				
			end
			it "assigns the requested receipt as @receipt" do
				Receipt.any_instance.stub(:update)
				receipt = Receipt.create! valid_attributes
				put :update, {:id => receipt.to_param, :receipt => valid_attributes}
				assigns(:receipt).should eq(receipt)
			end

			it "redirects to the list" do
				post :create, {:receipt => valid_attributes}
				response.should redirect_to( 'http://test.host/receipts/list')
			end
	    end
    end
end
