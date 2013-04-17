class AlterTask < ActiveRecord::Migration
  def up
  		add_column :tasks , :title, :string
  end

  def down
  end
end
