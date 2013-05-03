class AlterTask < ActiveRecord::Migration
  def up
  		add_column :tasks , :title, :string
  		add_column :tasks , :assigned , :boolean
  end

  def down
  end
end
