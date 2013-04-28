class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|

<<<<<<< HEAD:MME7/db/migrate/20130403114957_create_receipts.rb
    	t.string "name"
    	t.references :budget_component
=======
      t.string "name"
      t.references :budget_component
>>>>>>> master:MME7/db/migrate/20130403114957_create_receipts.rb

      t.timestamps
    end
  end
end
