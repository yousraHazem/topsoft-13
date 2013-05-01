class CreateNotificationUsers < ActiveRecord::Migration
  def change
    create_table :notification_users do |t|
    	t.references :notification
    	t.references :user
    	t.boolean "read" , :deafult => false
      t.timestamps
    end
  end
end
