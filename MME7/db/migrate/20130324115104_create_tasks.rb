class CreateTasks < ActiveRecord::Migration
 
  def change
    create_table :tasks do |t|
    	t.text "description"
    	t.refrences :user 
      t.timestamps
    end
  end
end
