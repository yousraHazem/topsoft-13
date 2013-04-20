class CreateBudgetComponents < ActiveRecord::Migration
  def change
    create_table :budget_components do |t|
    	t.string "name"
    	t.integer "quantity"
    	t.integer "unit_price"
    	t.boolean "status"
    	t.integer "total"
      t.timestamps
    end
  end
end
