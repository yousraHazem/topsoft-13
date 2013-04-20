class AlterPosts < ActiveRecord::Migration
  def up
    add_column :posts , :is_group , :boolean , :default => false
  end

  def down
  end
end