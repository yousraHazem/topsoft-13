class CreateReceipts < ActiveRecord::Migration
  def change
<<<<<<< HEAD
    create_table :receipts do |t|

      t.string "name"
      t.references :budget_component

      t.timestamps
=======
     create_table :receipts do |t|

     	t.string "name"
     	t.references :budget_component

       t.timestamps
>>>>>>> master
    end
  end
end
