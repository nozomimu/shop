class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :image_id
      t.integer :price
      t.text :description
      t.string :item_season
      t.integer :stock
      t.integer :category_id
      t.integer :color_id
      t.integer :size_id
      t.integer :brand_id
      t.integer :active, default: 0
      t.date :release_date

      t.timestamps
    end
  end
end
