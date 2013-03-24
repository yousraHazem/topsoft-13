class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
    	t.intger "amount"
    	t.intger "raised"
    	t.intger "noot_raised"
    	t.intger "spent"
    	t.intger "not_spent"
    	
      t.timestamps
    end
  end
end
