require 'spec_helper'

describe BudgetItemsController do
<<<<<<< HEAD
  #Authored by:Toka Abdelgabar 22-1925
=======
#Authored by:Toka Abdelgabar 22-1925
>>>>>>> toka-viewOBI-sprint1
  def valid_attributes
      {:name => 'comOne', :status => 'false', 
       :operational => 'true',:project_id =>'1'}
  end
<<<<<<< HEAD
  #Authored by:Toka Abdelgabar 22-1925
  describe "GET viewAllBI" do
    it "assigns all budget_items as @budget_items" do
      budget_item  = BudgetItem.create! valid_attributes
      get :viewAllBI, {:project_id => 1}  
     assigns(:budget_items).should eq([budget_item])
=======
#Authored by:Toka Abdelgabar 22-1925
  describe "GET viewoperationalBI" do
    it "assigns all budget_items as @budget_items" do
      budget_items  = BudgetItem.create! valid_attributes
      get :viewoperationalBI, {:project_id => 1}  
      assigns(:budget_items).should eq([budget_items])
>>>>>>> toka-viewOBI-sprint1
    end
  end
end