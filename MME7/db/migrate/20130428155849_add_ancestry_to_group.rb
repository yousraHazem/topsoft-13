class AddAncestryToGroup < ActiveRecord::Migration
  def self.up
    #add_column :groups, :ancestry, :string
    #add_index :groups, :ancestry
  end

  def self.down
    remove_index :groups, :ancestry
    remove_column :groups, :ancestry
  end
end
