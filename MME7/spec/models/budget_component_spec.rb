require 'spec_helper'
# require "budget_component"

# describe BudgetComponent do

#   before { @component = BudgetComponent.new(name: "Marketing", total_quantity: 10, quantity_purchased: 4,spent: 8 , total: 20,
#   	unit_price: 2, status: "Pending") }

#   subject { @component }

#   it { should respond_to(:name) } 
#   it { should respond_to(:total_quantity) }
#   it { should respond_to(:quantity_purchased) }
#   it { should respond_to(:unit_price) }
#   it { should respond_to(:status)}
#     it { should be_valid }

#   describe "when name is not present" do
#     before { @component.name = " " }
#     it { should_not be_valid }
#   end

#  describe "when purchased quantity is not present" do
#     before { @component.quantity_purchased = nil}
#     it { should_not be_valid }
#   end

#   describe "when total_quantity is not present" do
#     before { @component.total_quantity = nil }
#      it { should_not be_valid }
#    end

  # describe "when unit price is not present" do
  #   it { should validate_presence_of(:unit_price)}
  # end

  # describe "when unit_price is less than or equal zero" do
  #   before { @component.unit_price <= 0}
  #   it { should_not be_valid }
  # end

  #  describe "when quantity_purchased is less than or equal zero" do
  #   before { @component.quantity_purchased <= 0 }
  #   it { should_not be_valid }
  # end

  #  describe "when total_quantity is less than or equal zero" do
  #   before { @component.total_quantity <= 0}
  #   it { should_not be_valid }
  # end


  #  describe "when total_quantity is greater than 4 numbers" do
  #   before { @component.total_quantity = nil }
  #   it { should_not be_valid }
  # end

  # describe "when unit_price is greater than 4 numbers" do
  #   before { @component.unit_price = nil }
  #   it { should_not be_valid }
  # end


  # describe "when quantity_purchased is greater than 4 numbers" do
  #   before { @component.quantity_purchased = nil }
  #   it { should_not be_valid }
  # end

  #  describe "when quantity_purchased is greater than total quantity needed" do
  #   before { @component.quantity_purchased  > @component.total_quantity }
  #   it { should_not be_valid }
  # end  


describe BudgetComponent  do

   before { @component = BudgetComponent.new(name: "Marketing", total_quantity: 10, quantity_purchased: 4,spent: 8 , total: 20,
    unit_price: 2, status: "Pending") }

  subject { @component }

  it { should respond_to(:name) } 
  it { should respond_to(:total_quantity) }
  it { should respond_to(:quantity_purchased) }
  it { should respond_to(:unit_price) }
  it { should respond_to(:status)}
  it { should be_valid }

  it "should create a new instance given a valid attribute" do
    BudgetComponent.create!(@component)
  end

  it "should require a name" do
    no_name_component = BudgetComponent.new(@component.merge(:name => ""))
    no_name_component.should_not be_valid
  end

  describe "when quantity_purchased bigger than total_quantity" do
    before { :quantity_purchased >  :total_quantity}
    it { should_not be_valid }
  end

   describe "when purchased quantity is not present" do
    before { @component.quantity_purchased = nil}
    it { should_not be_valid }
  end

  describe "when total_quantity is not present" do
    before { @component.total_quantity = nil }
     it { should_not be_valid }
   end

  describe "when unit price is not present" do
       before { @component.unit_price = nil }
     it { should_not be_valid }
  end

 describe "when quantity_purchased smaller than or equal" do
   expect(:quantity_purchased).to be <= 0
    it { should_not be_valid }
  end

 #  describe "when unit_price smaller than or equal" do
 #    before { :unit_price.should be <= 0}
 #    it { should_not be_valid }
 #  end
 
 # describe "when total_quantity smaller than or equal" do
 #    before { :total_quantity.should be <=  0}
 #    it { should_not be_valid }
 #  end

end


