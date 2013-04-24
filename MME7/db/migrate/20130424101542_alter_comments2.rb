class AlterComments2 < ActiveRecord::Migration
  def up
  	add_column :comments , :name , :string
  end

  def down
  end
end