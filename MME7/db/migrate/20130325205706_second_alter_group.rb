class SecondAlterGroup < ActiveRecord::Migration
  def up
  	add_column(:groups, :community_id, :integer)
  end

  def down
  end
end
