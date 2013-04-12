class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_Nr
      t.string :address
      t.string :username
<<<<<<< HEAD
      t.boolean :isAdmin ,:default => false
=======

      t.boolean :isAdmin ,:default => false

>>>>>>> master

      t.timestamps
    end
  end
end
