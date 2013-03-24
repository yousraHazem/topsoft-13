class CreateBudgetSources < ActiveRecord::Migration
  def change
    create_table :budget_sources do |t|
    	t.string "name"
    	t.intger "amount"
      t.timestamps
    end
  end
end
