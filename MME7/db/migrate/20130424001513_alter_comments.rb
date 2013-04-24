class AlterComments < ActiveRecord::Migration
  def up
  	add_column :comments , :is_group , :boolean , :default => false
  end

  def down
  end
end