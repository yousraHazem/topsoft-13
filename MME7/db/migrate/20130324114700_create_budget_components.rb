class CreateBudgetComponents < ActiveRecord::Migration
  def change
    create_table :budget_components do |t|
    	t.string "name"
    	t.intger "quantity"
    	t.intger "unit_price"
    	t.boolean "status"
    	t.intger "total"
    	t.image "attachment"
      t.timestamps
    end
  end
end
