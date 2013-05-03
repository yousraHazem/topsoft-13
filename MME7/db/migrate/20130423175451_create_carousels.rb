class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|

    	t.string "title"
    	t.string "description"
    	t.boolean "show"

      t.timestamps
    end
  end
end
