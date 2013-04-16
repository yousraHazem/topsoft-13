require 'spec_helper'

describe BudgetSourceProject do

  before (:each) do
  @budgetsource = BudgetSourceProject.new(:amount => 1000) 

  end
  subject { @budgetsource }

  it { should respond_to(:amount) }
  it { should be_valid }

 it "budget source with amount less than zero" do
 @budgetsource = BudgetSourceProject.new amount:-1
 @budgetsource.should_not be_valid
end
end 