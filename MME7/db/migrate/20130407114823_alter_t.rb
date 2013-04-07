class AlterT < ActiveRecord::Migration
  def up
  	change_column :task_users , :assigned ,:boolean, :default=> false
  end

  def down
  end
end
