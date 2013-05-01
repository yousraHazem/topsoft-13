class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string "image2"
      t.timestamps
    end
  end
end
