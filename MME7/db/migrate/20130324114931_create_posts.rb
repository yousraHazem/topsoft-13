class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.text "content"
    	t.references :group
    	t.references :project
      t.timestamps
    end
  add_index :post, :group_id
  end
end
