require 'spec_helper'

describe BudgetItemsController do
#Authored by:Toka Abdelgabar 22-1925
  def valid_attributes
      {:name => 'comOne', :status => 'false', 
       :operational => 'true',:project_id =>'1'}
  end
#Authored by:Toka Abdelgabar 22-1925
  describe "GET viewoperationalBI" do
    it "assigns all budget_items as @budget_items" do
      budget_items  = BudgetItem.create! valid_attributes
      get :viewoperationalBI, {:project_id => 1}  
      assigns(:budget_items).should eq([budget_items])
    end
  end
end