class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|

      t.string "name"
      t.references :budget_component

      t.timestamps
    end
  end
end
