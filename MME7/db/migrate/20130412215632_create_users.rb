class CreateUsers < ActiveRecord::Migration
  def up
  	 create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_Nr
      t.string :address
      t.string :username
      t.boolean :isAdmin

      t.timestamps
  end
end
  def down
  end
end
