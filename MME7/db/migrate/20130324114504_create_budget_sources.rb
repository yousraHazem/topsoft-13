class CreateBudgetSources < ActiveRecord::Migration
  def change
    create_table :budget_sources do |t|
    	t.string "name"
    	t.integer "amount"
      t.timestamps
    end
  end
end
