class Alterposts3 < ActiveRecord::Migration
  def up
  	add_column :posts , :name , :string
  end

  def down
  end
end