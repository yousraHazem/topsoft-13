class AlterGroupLevel < ActiveRecord::Migration
  def up
    remove_column :groups , :levels
    add_column :groups , :level , :integer
  end

  def down
  end
end
