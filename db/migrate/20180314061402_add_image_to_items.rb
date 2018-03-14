class AddImageToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :image2_id, :text
    add_column :items, :image3_id, :text
    add_column :items, :image4_id, :text
    add_column :items, :image5_id, :text
  end
end
