class CreateTaskUsers < ActiveRecord::Migration
  def change
    create_table :task_users do |t|
<<<<<<< HEAD
    	t.references :task
    	t.references :user
    	t.boolean "assigned"
=======
<<<<<<< HEAD
    	t.references :task
    	t.references :user
    	t.boolean "assigned"
=======
      t.references :task
      t.references :user
      t.boolean "assigned"
>>>>>>> master
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a

      t.timestamps
    end
  end
<<<<<<< HEAD
end
=======
<<<<<<< HEAD
end
=======
end
>>>>>>> master
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a
