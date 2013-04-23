class AlterNotifications < ActiveRecord::Migration
  def up
  	add_column :not_users , :read , :boolean , :default=>false
  end

  def down
  end
end
