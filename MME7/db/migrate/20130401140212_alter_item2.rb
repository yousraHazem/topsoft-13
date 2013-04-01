class AlterItem2 < ActiveRecord::Migration
  def up
  	add_column :tasks , :assigned, :boolean , :default=>false
  end

  def down
  end
end
