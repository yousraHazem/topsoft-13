require 'spec_helper'

describe BudgetItem do

  before { @budgetItem = BudgetItem.new(name: "Example User", operational: "sdkjsdjfdjfjd") }

  subject { @budgetItem }

  it { should respond_to(:name) } 
  it { should respond_to(:operational) }

    it { should be_valid }
    
    describe "when name is not present" do
    before { @budgetItem.name = " " }
    it { should_not be_valid }
  end
end 