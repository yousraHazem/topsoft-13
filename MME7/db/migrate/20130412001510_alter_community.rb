 class AlterCommunity < ActiveRecord::Migration
  def up
    add_column :communities , :is_dismissed , :boolean
  end

  def down
  end
end