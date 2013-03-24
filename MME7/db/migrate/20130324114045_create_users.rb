class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string "first_name", :limit => 20
    t.string "last_name",  :limit => 50
    t.string "email" 
    t.string "phone_Nr", :limit => 15
    t.string "address"
    t.string "username", :limit => 20
    t.string "password", :limit => 10
    t.boolean "isAdmin"
    t.refrences :project 
    t.refrences :coment 
      t.timestamps
    end
  end
end
