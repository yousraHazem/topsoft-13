class CreateNotUsers < ActiveRecord::Migration
  def change
    create_table :not_users do |t|
      t.references :user
      t.references :not
      t.string :category
      t.timestamps
    end
  end
end
