class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.image "attachment"
    	t.text "content"
    	t.refrences :user
    	t.refrences :comment 
      t.timestamps
    end
  end
end
