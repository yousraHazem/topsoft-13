class AlterCarousel2 < ActiveRecord::Migration
  def up
  	change_column :carousels , :show , :boolean , :default => true 
  end

  def down
  end
end
