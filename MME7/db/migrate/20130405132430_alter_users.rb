class AlterUsers < ActiveRecord::Migration
  def ups
    remove_column :users, :username
  end

  def down
  end
end