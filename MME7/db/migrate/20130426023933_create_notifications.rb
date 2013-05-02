class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	t.string "content"
    	t.string "url"
    	t.string "image"
      t.timestamps
    end
  end
end
