# == Schema Information

# Table name: budget_components

#  id         :integer          not null, primary key
#  name       :string(255)
#  unit_price :integer
#  quantity_purchased   :integer
#  total_quantity    :integer

require 'spec_helper'

describe BudgetComponent do

  before { @component = BudgetComponent.new(name: "Marketing", total_quantity: 10, quantity_purchased: 4, 
  	unit_price: 2, status: "Pending") }

  subject { @component }

  it { should respond_to(:name) } 
  it { should respond_to(:total_quantity) }
  it { should respond_to(:quantity_purchased) }
  it { should respond_to(:unit_price) }

    it { should be_valid }

  describe "when name is not present" do
    before { @component.name = " " }
    it { should_not be_valid }
  end

 describe "when purchased quantity is not present" do
    before { @component.quantity_purchased = nil}
    it { should_not be_valid }
  end

  # describe "when total_quantity is not present" do
  #   before { @component.total_quantity = nil }
  #   it { should_not be_valid }
  # end

  describe "when unit_price is not present" do
    before { @component.unit_price = nil }
    it { should_not be_valid }
  end

   describe "when quantity_purchased is greater than total quantity needed" do
    before { @component.quantity_purchased  > @component.total_quantity }
    it { should_not be_valid }
  end    

end