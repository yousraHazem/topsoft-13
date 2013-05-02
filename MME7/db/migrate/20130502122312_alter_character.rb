class AlterCharacter < ActiveRecord::Migration
  def up
  	 add_column :characters , :project_id , :integer
  end

  def down
  end
end
