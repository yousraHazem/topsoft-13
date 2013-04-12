class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.references :project
    	t.integer "amount"
    	t.integer "raised"
    	t.integer "noot_raised"
    	t.integer "spent"
    	t.integer "not_spent"
    	
      t.timestamps
    end
  end
end
