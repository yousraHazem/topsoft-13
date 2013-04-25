class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|

    	t.references :budget_component

      t.timestamps
    end
  end
end
