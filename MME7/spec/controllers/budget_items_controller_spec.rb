require 'spec_helper'

describe BudgetItemsController do

  def valid_attributes
      {:name => 'comOne', :status => 'false', 
       :operational => 'true',:project_id =>'1'}
  end

  def valid_attributes_operational
      {:name => 'comOne', :status => 'false', 
       :operational => 'true',:project_id =>'1'}
  end
  describe "GET viewoperationalBI" do
    it "assigns all budget_items as @budget_items" do
      budget_items  = BudgetItem.create! valid_attributes
      get :viewoperationalBI, {:project_id => 1}  
      assigns(:budget_items).should eq([budget_items])
    end
  end
end