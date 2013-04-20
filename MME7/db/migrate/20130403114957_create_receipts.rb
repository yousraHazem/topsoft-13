class CreateReceipts < ActiveRecord::Migration
  def change
<<<<<<< HEAD
    create_table :receipts do |t|
=======
<<<<<<< HEAD
    create_table :receipts do |t|

    	t.string "name"
    	t.references :budget_component

      t.timestamps
=======
     create_table :receipts do |t|
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a

    	t.string "name"
    	t.references :budget_component

<<<<<<< HEAD
      t.timestamps
=======
       t.timestamps
>>>>>>> master
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a
    end
  end
end
