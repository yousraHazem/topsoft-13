class AlterTaskUsers < ActiveRecord::Migration
  def up
  	remove_column :task_users , :assigned
  end

  def down
  end
end
