class AlterNotification < ActiveRecord::Migration
  def up
  	add_column :nots , :url , :string 
  end

  def down
  end
end
