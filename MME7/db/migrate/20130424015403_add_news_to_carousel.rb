class AddNewsToCarousel < ActiveRecord::Migration
  def change
    add_column :carousels, :news, :string
  end
end
