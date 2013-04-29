class AlterReceipts2 < ActiveRecord::Migration
  def up

  	add_column :receipts , :name , :string
  end

  def down
  end
end
