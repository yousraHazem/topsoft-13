class Alternot < ActiveRecord::Migration
  def up
  	change_column :notification_users , :read , :boolean , :default => false
  end

  def down
  end
end
