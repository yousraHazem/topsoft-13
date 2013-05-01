class AlterGroup < ActiveRecord::Migration
  def up
  	add_column :groups, :ancestry, :string
    add_index :groups, :ancestry
    remove_column :groups , :levels
    add_column :groups , :level , :integer
  end

  def down
  end
end
