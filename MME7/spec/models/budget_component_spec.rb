require 'spec_helper'
  
describe BudgetComponent  do


  before(:each) do
   @component = BudgetComponent.new(name: "Marketing", total_quantity: 10, quantity_purchased: 4,spent: 8 , total: 20,
    unit_price: 2, status: "Pending")
   end

  subject { @component }

  it { should respond_to(:name) } 
  it { should respond_to(:total_quantity) }
  it { should respond_to(:quantity_purchased) }
  it { should respond_to(:unit_price) }
  it { should respond_to(:status)}
  it { should be_valid }


  it "is not valid with quantity_purchased greater than total_quantity" do
  component = BudgetComponent.create(name: 'Buggy', quantity_purchased:1, total_quantity: 3)
  component.quantity_purchased.should  be <= component.total_quantity
  end

it "is not valid with quantity_purchased greater than total_quantity" do
  component = BudgetComponent.new quantity_purchased:12 , total_quantity:3
  component.should_not be_valid
end


it "is not valid without a name" do
  component = BudgetComponent.new name:"", unit_price:12
  component.should_not be_valid
end

it "is not valid without a quantity_purchased" do
  component = BudgetComponent.new name:"market", quantity_purchased:nil
  component.should_not be_valid
end

it "is not valid without a unit_price" do
  component = BudgetComponent.new name:"market", unit_price:nil
  component.should_not be_valid
end

it "is not valid without a total_quantity" do
  component = BudgetComponent.new name:"market", total_quantity:nil
  component.should_not be_valid
end

it "is not valid with an unit_price less than zero" do
  component = BudgetComponent.new name:"market", unit_price:-12
  component.should_not be_valid
end

it "is not valid with an unit_price equal zero" do
  component = BudgetComponent.new name:"market", unit_price:0
  component.should_not be_valid
end


it "is not valid with an quantity_purchased less than zero" do
  component = BudgetComponent.new name:"market", quantity_purchased:-12
  component.should_not be_valid
end

it "is not valid with an quantity_purchased equal zero" do
  component = BudgetComponent.new name:"market", quantity_purchased:0
  component.should_not be_valid
end

it "is not valid with an total_quantity less than zero" do
  component = BudgetComponent.new name:"market", total_quantity:-12
  component.should_not be_valid
end

it "is not valid with an total_quantity equal zero" do
  component = BudgetComponent.new name:"market", total_quantity:0
  component.should_not be_valid
end


it "is not valid with an total_quantity greater than 99999" do
  component = BudgetComponent.new name:"market", total_quantity:1000000
  component.should_not be_valid
end

it "is not valid with an unit_price greater than 99999" do
  component = BudgetComponent.new name:"market", unit_price:1000000
  component.should_not be_valid
end

it "is not valid with an quantity_purchased greater than 99999" do
  component = BudgetComponent.new name:"market", quantity_purchased:1000000
  component.should_not be_valid
end

end


