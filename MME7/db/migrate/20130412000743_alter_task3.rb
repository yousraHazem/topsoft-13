 class AlterTask3 < ActiveRecord::Migration
  def up
    change_column :tasks , :assigned , :boolean , :default => false
  end

  def down
  end
end