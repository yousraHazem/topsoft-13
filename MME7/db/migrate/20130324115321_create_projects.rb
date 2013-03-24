class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string "project_name"
  		t.date  "start_date"
  		t.date  "end_date"
  		t.text "description"
  		t.boolean "private_or_public"
  		t.boolean "admin_or_member" #whos the creator 
      t.refrence :post
      t.refrence :user
      t.timestamps
    end
  end
end
