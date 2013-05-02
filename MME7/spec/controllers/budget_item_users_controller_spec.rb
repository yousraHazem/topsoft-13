require 'spec_helper'

describe BudgetItemUsersController do
	 def valid_attributes
      {:budget_item_id => 1 , :user_id => 1}
   end
 describe "POST assign" do
    describe "with valid params" do
      it "creates a new budget_item" do
        expect {
        post :assign
        }.to change(BudgetItemUser, :count).by(1)
    end 
  end 
end
describe "unassign budget_item to user" do
    it "destroys the requested budget_item" do
      @budgte_item = BudgetItemUser.create! valid_attributes
      expect {
        delete :unassign, {:id => @budget_item.to_param}
      }.to change(BudgetItemUser, :count).by(0)
    end
end

end
