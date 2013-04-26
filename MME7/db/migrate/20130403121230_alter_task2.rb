class AlterTask2 < ActiveRecord::Migration
  def up
  	add_column :tasks , :assigned , :boolean
  end

  def down
  end
end
