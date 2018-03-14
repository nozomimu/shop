class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :kana_lastname
      t.string :kana_firstname
      t.string :postal_code
      t.string :address
      t.string :address_more
      t.string :phone
      t.string :phone2
      t.string :phone3
      t.integer :order_status,default: 0

      t.timestamps
    end
  end
end
