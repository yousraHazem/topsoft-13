class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string "group_name", :limit => 50
    	t.text "description"
    	t.string "levels"
    	t.references :user 
      t.timestamps
    end
  end
end
