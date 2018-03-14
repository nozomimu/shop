class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :order_id
      t.integer :quantity
      t.integer :count
      t.integer :price
      t.integer :saved_price
      t.integer :color_id
      t.integer :size_id
      t.integer :brand_id
      t.integer :category_id
      t.string :item_season
      t.date :release_date


      t.timestamps
    end
  end
end
