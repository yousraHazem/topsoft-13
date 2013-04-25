class Addtype < ActiveRecord::Migration
  def up
  	add_column :nots , :type , :string
  end

  def down
  end
end
