require 'spec_helper'

describe BudgetSource do

  before (:each) do
  @budgetsource = BudgetSource.new(:name => "Pepsi", :amount => 1000) 

  end
  subject { @budgetsource }

  it { should respond_to(:name) } 
  it { should respond_to(:amount) }
  it { should be_valid }
    
   it "budget source without a name" do
 @budgetsource = BudgetSource.new name:"", :amount => 1000
 @budgetsource.should_not be_valid
end
  it "budget source with amount equal zero" do
 @budgetsource = BudgetSource.new name:"pepsi", amount:0
 @budgetsource.should_not be_valid
end

 it "budget source with amount less than zero" do
 @budgetsource = BudgetSource.new name:"Pepsi", amount:-1
 @budgetsource.should_not be_valid
end
end 