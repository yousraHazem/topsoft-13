class AlterProject2 < ActiveRecord::Migration
  def up
  	add_column :projects , :is_frozen , :boolean , :default => false
  end

  def down
  end
end
