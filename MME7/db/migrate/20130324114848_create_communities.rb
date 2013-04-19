class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
    t.string "title"
    t.text "social_profile_info"
    t.text "contact_info"
      t.timestamps
    end
  end
end
