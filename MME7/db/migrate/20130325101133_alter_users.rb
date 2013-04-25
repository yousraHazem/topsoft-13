class AlterUsers < ActiveRecord::Migration
  def up
  	remove_column :users , :project_id
  end

  def down
  end
end
