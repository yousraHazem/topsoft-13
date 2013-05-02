class AlterCarousel < ActiveRecord::Migration
  def up
  	add_column :carousels , :project_id , :integer
  end

  def down
  end
end
