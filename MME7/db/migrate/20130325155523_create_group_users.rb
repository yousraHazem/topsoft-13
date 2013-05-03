class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
    	t.references :group
    	t.references :user
    	t.boolean "isCreator"
      t.timestamps
    end
  end
end
