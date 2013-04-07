class AlterUser2 < ActiveRecord::Migration
  def up
  	add_column :users , :name , :string
  end

  def down
  end
end
