class AlterNot < ActiveRecord::Migration
  def up
  	rename_column :nots , :type ,:image
  end

  def down
  end
end
