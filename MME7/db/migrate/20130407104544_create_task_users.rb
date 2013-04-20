class CreateTaskUsers < ActiveRecord::Migration
  def change
    create_table :task_users do |t|
<<<<<<< HEAD
    	t.references :task
    	t.references :user
    	t.boolean "assigned"
=======
      t.references :task
      t.references :user
      t.boolean "assigned"
>>>>>>> master

      t.timestamps
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> master
