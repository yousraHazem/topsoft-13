class CreateTaskUsers < ActiveRecord::Migration
  def change
    create_table :task_users do |t|
    	t.references :task
    	t.references :user
    	t.boolean "assigned"

      t.timestamps
    end
  end
end
